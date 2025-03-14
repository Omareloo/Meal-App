import 'package:either_dart/either.dart';
import 'package:meal_ware/features/auth/domain/repositories/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<String, void>> execute(String email, String password) {
    return repo.login(email, password);
  }
}
