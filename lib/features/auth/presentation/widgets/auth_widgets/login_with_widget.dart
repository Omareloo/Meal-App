import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/style/app_color.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Container(
          height: 1,
          width: 92.w,
          color: AppColor.white,
          margin: EdgeInsets.only(right: 10),
        ),
        Text('or login With',style: TextStyle(color: AppColor.white),),
        Container(
          height: 1,
          width: 92.w,
          color: AppColor.white,
          margin: EdgeInsets.only(left: 10),
        )
      ],
    );
  }
}
