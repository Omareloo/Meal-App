import 'package:either_dart/either.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';
import 'package:meal_ware/features/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase {
  AuthRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<String, void>> execute(UserModel user) {
    return repo.signUp(user);
  }
}
