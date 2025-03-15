import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/core/di/db_injection.dart';
import 'package:meal_ware/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_cubit.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_state.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/login/login_message_widget.dart';
import 'package:meal_ware/features/auth/presentation/widgets/buttons/register_button.dart';
import 'package:meal_ware/features/auth/presentation/widgets/fields/email_form_field.dart';
import '../widgets/auth_widgets/facebook_google_widget.dart';
import '../widgets/auth_widgets/logo.dart';
import '../widgets/auth_widgets/register/register_check_box.dart';
import '../widgets/fields/name_form_field.dart';
import '../widgets/fields/password_form_field.dart';
import '../widgets/fields/phone_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<SignUpUseCase>()),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColor.backGround,
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              if (Navigator.canPop(context)) Navigator.pop(context);
            }

            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error), backgroundColor: Colors.red),
              );
            }

            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Registration Successful"), backgroundColor: Colors.green),
              );
            }
          },
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              final cubit = context.read<RegisterCubit>();

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const LogoWidget(),
                        12.hs,
                        UserNameFormField(userNameController: cubit.nameController),
                        8.hs,
                        EmailFormField(emailController: cubit.emailController),
                        8.hs,
                        PhoneFormField(phoneController: cubit.phoneController),
                        8.hs,
                        PasswordFormField(passwordController: cubit.passwordController),
                        12.hs,
                        RegisterButton(onPressed: () => cubit.register()),
                        8.hs,
                        const RegisterCheckBox(),
                        12.hs,
                        const FacebookGoogleWidget(),
                        8.hs,
                        const LoginMessageWidget(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
