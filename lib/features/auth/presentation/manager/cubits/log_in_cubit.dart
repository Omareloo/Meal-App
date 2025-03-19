import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_states.dart';

class LogInCubit extends Cubit<LoginState> {
  LogInCubit(this.useCase) : super(LoginInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginUseCase useCase;

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(LoginLoading());
    Either<String, void> eitherResponse =
    await useCase.execute(emailController.text, passwordController.text);
    eitherResponse.fold(
          (error) {
        emit(LoginFailure(error: error));
      },
          (success) {
        emit(LoginSuccess());
      },
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
}
}
