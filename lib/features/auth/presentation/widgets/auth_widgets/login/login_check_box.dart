import 'package:flutter/material.dart';

import '../../../../../../config/style/app_color.dart';
import '../../../../../../config/style/app_text_styles.dart';

class LoginCheckBox extends StatefulWidget {
  const LoginCheckBox({super.key});

  @override
  State<LoginCheckBox> createState() => _LoginCheckBoxState();
}

class _LoginCheckBoxState extends State<LoginCheckBox> {

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isCheck,
          onChanged: (value)
          {
            setState(() {
              isCheck = value!;
            });
          },
          checkColor: AppColor.backGround,
          activeColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: AppColor.white),
          ),
          side: BorderSide(color: AppColor.white),
        ),
        Expanded(child: Text('Remember me and keep me login',style: AppTextStyle.font13white400,)),
      ],
    );
  }
}
