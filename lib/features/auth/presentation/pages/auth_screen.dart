import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_cubit.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_states.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/login_with_widget.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/logo.dart';
import 'package:meal_ware/features/auth/presentation/widgets/fields/name_form_field.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/register/register_message_widget.dart';
import '../widgets/auth_widgets/facebook_google_widget.dart';
import '../widgets/auth_widgets/login/login_check_box.dart';
import '../widgets/buttons/login_button.dart';
import '../widgets/fields/password_form_field.dart';
import 'package:meal_ware/core/di/db_injection.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(getIt<LoginUseCase>()), // ✅ Use 'getIt' instead
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColor.backGround,
        body: BlocListener<LogInCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }

            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }

            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Successful")),
              );
              // Navigate to Home or Dashboard screen
            }
          },
          child: BlocBuilder<LogInCubit, LoginState>(
            builder: (context, state) {
              final cubit = context.read<LogInCubit>();

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: cubit.formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const LogoWidget(),
                          20.hs,
                          UserNameFormField(userNameController: cubit.emailController),
                          16.hs,
                          PasswordFormField(passwordController: cubit.passwordController),
                          16.hs,
                          AppLoginButton(onPressed: () => cubit.login(context), isLoading: state is LoginLoading),
                          16.hs,
                          const LoginCheckBox(),
                          20.hs,
                          const LoginWithWidget(),
                          16.hs,
                          const FacebookGoogleWidget(),
                          16.hs,
                          const RegisterMessageWidget(),
                        ],
                      ),
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
