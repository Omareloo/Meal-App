import 'package:flutter/material.dart';

import '../../../../../../config/style/app_color.dart';
import '../../../../../../config/style/app_text_styles.dart';

class RegisterCheckBox extends StatefulWidget {
  const RegisterCheckBox({super.key});

  @override
  State<RegisterCheckBox> createState() => _RegisterCheckBoxState();
}

class _RegisterCheckBoxState extends State<RegisterCheckBox> {

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
        Expanded(child: Text('by creating an account you agree to our terms and conditions',style: AppTextStyle.font13white400,)),
      ],
    );
  }
}
