import 'package:flutter/material.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/login/login_message_widget.dart';
import 'package:meal_ware/features/auth/presentation/widgets/buttons/register_button.dart';
import 'package:meal_ware/features/auth/presentation/widgets/fields/email_form_field.dart';
import '../../../../config/style/app_color.dart';
import '../widgets/auth_widgets/facebook_google_widget.dart';
import '../widgets/auth_widgets/login/login_check_box.dart';
import '../widgets/auth_widgets/logo.dart';
import '../widgets/auth_widgets/register/register_check_box.dart';
import '../widgets/fields/name_form_field.dart';
import '../widgets/fields/password_form_field.dart';
import '../widgets/fields/phone_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: AppColor.backGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LogoWidget(),
              12.hs,
             // UserNameFormField(),
              8.hs,
              EmailFormField(),
              8.hs,
              PhoneFormField(),
              8.hs,
             // PasswordFormField(),
              12.hs,
              RegisterButton(),
              8.hs,
              RegisterCheckBox(),
              12.hs,
              FacebookGoogleWidget(),
              8.hs,
              LoginMessageWidget()
            ],
          ),
        ),
      ),
    );
  }
}
