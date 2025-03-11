import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/login_with_widget.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/logo.dart';
import 'package:meal_ware/features/auth/presentation/widgets/fields/name_form_field.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/register/register_message_widget.dart';
import '../widgets/auth_widgets/facebook_google_widget.dart';
import '../widgets/auth_widgets/login/login_check_box.dart';
import '../widgets/buttons/login_button.dart';
import '../widgets/fields/password_form_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: AppColor.backGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LogoWidget(),
                20.hs,
                UserNameFormField(),
                16.hs,
                PasswordFormField(),
                16.hs,
                AppLoginButton(),
                16.hs,
                LoginCheckBox(),
                20.hs,
                LoginWithWidget(),
                16.hs,
                FacebookGoogleWidget(),
                16.hs,
                RegisterMessageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
