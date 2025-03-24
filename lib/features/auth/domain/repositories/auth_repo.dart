import 'package:either_dart/either.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<String, void>> login(String email, String password);
  Future<Either<String, void>> signUp(UserModel user);
  Future<Either<String, void>> createCurrentUser(UserModel user);

}
