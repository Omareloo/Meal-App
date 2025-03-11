import 'package:flutter/material.dart';

import '../../../../config/style/app_color.dart';
import '../../../../config/style/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.backGround,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          elevation: 0,
          minimumSize:  Size(300, 57),
        ),
        child:  Text('login',style: AppTextStyle.font21background700,),
        onPressed: () {},
    );
  }
}
