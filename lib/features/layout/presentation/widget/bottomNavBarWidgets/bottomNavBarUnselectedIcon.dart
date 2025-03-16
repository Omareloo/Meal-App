import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/style/app_color.dart';

class BottomNavBarUnselectedIcon extends StatelessWidget {

  String image;
  BottomNavBarUnselectedIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      width: 40.w,
      height: 40.h,
      color: AppColor.backGround,
    );
  }
}
