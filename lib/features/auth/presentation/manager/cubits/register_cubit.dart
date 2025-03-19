import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';
import 'package:meal_ware/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_state.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpUseCase signUpUseCase;

  RegisterCubit(this.signUpUseCase) : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// 🔹 Handle User Registration
  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    emit(RegisterLoading());

    final user = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    final result = await signUpUseCase.execute(user);

    result.fold(
          (error) => emit(RegisterFailure(error)), // ❌ Handle failure
          (_) => emit(RegisterSuccess()), // ✅ Success state
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
