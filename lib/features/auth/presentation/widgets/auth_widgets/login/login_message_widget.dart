import 'package:flutter/material.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';
import '../../../../../../config/style/app_color.dart';
import '../../../../../../config/style/app_text_styles.dart';

class LoginMessageWidget extends StatelessWidget {
  const LoginMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(
          'Do you have an account?',style: TextStyle(color: AppColor.white),),
        TextButton(
          onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthScreen(),));
          },
          child: Text(
            'Login Now',style: AppTextStyle.font16white700,),
        ),],
    );
  }
}
