import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileModel.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileService.dart';
import 'package:meal_ware/core/di/db_injection.dart';
import 'package:meal_ware/features/auth/data/models/requests/log_in_request_body.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';
import 'package:either_dart/either.dart';

abstract class DataSource {
  Future<Either<String, void>> signup(UserModel user);
  Future<Either<String, void>> createCurrentUser(UserModel user);
  Future<Either<String, String>> getCurrentUid();
  Future<Either<String, bool>> logIn(LoginRequestBody loginRequestBody);
}

class AuthDataSourceImpl implements DataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthDataSourceImpl({required this.auth, required this.firestore});

  /// 🔹 Sign up a user with Firebase Authentication
  @override
  Future<Either<String, void>> signup(UserModel user) async {
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      final UserModel newUser = UserModel(
        id: userCredential.user?.uid,
        name: user.name,
        email: user.email,
        phone: user.phone,
      );

      // Save user data in Firestore
      final result = await createCurrentUser(newUser);
      if (result.isLeft) return result; // Return error if Firestore fails

      // Fetch or create the profile and save it locally
      return await _fetchAndSaveProfile(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(_mapFirebaseErrorCodeToMessage(e.code));
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  /// 🔹 Get the current user ID
  @override
  Future<Either<String, String>> getCurrentUid() async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        return Left('No user is currently logged in.');
      }
      return Right(user.uid);
    } catch (e) {
      return Left('Failed to get user ID: $e');
    }
  }

  /// 🔹 Store the user in Firestore
  @override
  Future<Either<String, void>> createCurrentUser(UserModel user) async {
    try {
      final userCollection = firestore.collection('users');
      final uidResult = await getCurrentUid();

      return uidResult.fold(
            (error) => Left(error),
            (uid) async {
          final userDoc = await userCollection.doc(uid).get();
          if (!userDoc.exists) {
            await userCollection.doc(uid).set({
              'id': user.id,
              'name': user.name,
              'email': user.email,
              'phone': user.phone,
            });
          }
          return const Right(null);
        },
      );
    } catch (e) {
      return Left('Failed to create user in Firestore: $e');
    }
  }

  /// 🔹 Login a user using Firebase Authentication
  @override
  Future<Either<String, bool>> logIn(LoginRequestBody loginRequestBody) async {
    try {
      final email = loginRequestBody.email?.trim() ?? '';
      final password = loginRequestBody.password ?? '';

      if (email.isEmpty || password.isEmpty) {
        return const Left('Email and password cannot be empty.');
      }

      final UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return const Left('Login failed. Please try again.');
      }

      // Fetch or create the profile and save it locally
      final profileResult = await _fetchAndSaveProfile(firebaseUser);

      return profileResult.fold(
            (error) => Left(error),
            (_) => const Right(true),
      );
    } on FirebaseAuthException catch (e) {
      return Left(_mapFirebaseErrorCodeToMessage(e.code));
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  /// 🔹 Fetch user profile from Firestore, or create it if missing, then save locally
  Future<Either<String, void>> _fetchAndSaveProfile(User firebaseUser) async {
    try {
      final userCollection = firestore.collection('users');
      final userDoc = await userCollection.doc(firebaseUser.uid).get();

      ProfileModel profile;

      if (userDoc.exists && userDoc.data() != null) {
        final data = userDoc.data()!;
        profile = ProfileModel(
          data['email'] ?? firebaseUser.email ?? '',
          data['name'] ?? firebaseUser.displayName ?? 'Unknown',
          data['phone'] ?? firebaseUser.phoneNumber ?? 'N/A',
        );
      } else {
        // If user profile doesn't exist, create one
        profile = ProfileModel(
          firebaseUser.email ?? '',
          firebaseUser.displayName ?? 'Unknown',
          firebaseUser.phoneNumber ?? 'N/A',
        );

        await userCollection.doc(firebaseUser.uid).set({
          'email': profile.email,
          'name': profile.username,
          'phone': profile.phoneNumber,
        });
      }

      // Save profile locally using Hive
      ProfileService service = getIt<ProfileService>();
      await service.saveProfile(profile);

      return const Right(null);
    } catch (e) {
      return Left('Failed to retrieve or create user profile: $e');
    }
  }

  /// 🔹 Map Firebase Authentication errors to user-friendly messages
  String _mapFirebaseErrorCodeToMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Invalid email format.';
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Try again.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'email-already-in-use':
        return 'This email is already registered. Try logging in.';
      case 'weak-password':
        return 'Your password is too weak. Try using a stronger password.';
      case 'network-request-failed':
        return 'Network error. Check your internet connection.';
      default:
        debugPrint('⚠️ Unhandled Firebase Auth Error Code: $code');
        return 'Authentication failed. Please try again later.';
    }
  }
}
