import 'package:flutter/material.dart';

import '../../../../config/style/app_color.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        TextButton(
          onPressed: (){},
          child: Text(
            'Don\'t have an account?',style: TextStyle(color: AppColor.white),),
        ),
        TextButton(
          onPressed: (){},
          child: Text(
            'Register Now',style: TextStyle(color: AppColor.white,),),
        ),],
    );
  }
}
