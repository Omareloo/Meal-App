import 'package:flutter/material.dart';
import '../../../../../../config/style/app_color.dart';
import '../../../../../../config/style/app_text_styles.dart';
import '../../../pages/register_screen.dart';

class RegisterMessageWidget extends StatelessWidget {
  const RegisterMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(
          'Don\'t have an account?',style: TextStyle(color: AppColor.white),),
        TextButton(
          onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
          },
          child: Text(
            'Register Now',style: AppTextStyle.font16white700,),
        ),],
    );
  }
}
