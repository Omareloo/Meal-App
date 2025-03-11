import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/auth/presentation/widgets/login_with_widget.dart';
import 'package:meal_ware/features/auth/presentation/widgets/logo.dart';
import 'package:meal_ware/features/auth/presentation/widgets/name_form_field.dart';
import 'package:meal_ware/features/auth/presentation/widgets/register_widget.dart';
import '../../../../generated/assets.dart';
import '../widgets/app_button.dart';
import '../widgets/password_form_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: AppColor.backGround,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LogoWidget(),
              70.hs,
              UserNameFormField(),
              20.hs,
              PasswordFormField(),
              20.hs,
              AppButton(),
              24.hs,
              LoginWithWidget(),
              20.hs,
              RegisterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
