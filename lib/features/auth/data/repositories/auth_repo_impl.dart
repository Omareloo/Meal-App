import 'package:meal_ware/features/auth/data/data_source/auth_datasource.dart';
import 'package:meal_ware/features/auth/data/models/requests/log_in_request_body.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';
import 'package:meal_ware/features/auth/domain/repositories/auth_repo.dart';
import 'package:either_dart/either.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSourceImpl authDataSourceImpl;
  final Connectivity connectivity;

  AuthRepoImpl(this.authDataSourceImpl, this.connectivity);

  /// 🔹 Login User
  @override
  Future<Either<String, bool>> login(String email, String password) async {
    final loginRequestBody = LoginRequestBody(
      email: email.trim(),
      password: password,
    );

    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const Left("No internet connection. Please check your network and try again.");
    }

    try {
      return await authDataSourceImpl.logIn(loginRequestBody);
    } catch (e) {
      return const Left("An unexpected error occurred. Please try again later.");
    }
  }

  /// 🔹 Sign Up User & Create Firestore Record
  @override
  Future<Either<String, void>> signUp(UserModel user) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const Left("No internet connection. Please check your network and try again.");
    }

    try {
      return await authDataSourceImpl.signup(user);
    } catch (e) {
      return const Left("An unexpected error occurred during sign-up. Please try again later.");
    }
  }

  /// 🔹 Create Firestore User Document
  @override
  Future<Either<String, void>> createCurrentUser(UserModel user) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const Left("No internet connection. Please check your network and try again.");
    }

    try {
      return await authDataSourceImpl.createCurrentUser(user);
    } catch (e) {
      return const Left("An unexpected error occurred while creating the user. Please try again later.");
    }
  }

}
