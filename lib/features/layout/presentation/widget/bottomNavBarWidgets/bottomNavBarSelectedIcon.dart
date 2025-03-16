import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/style/app_color.dart';

class BottomNavbarSelectedIcon extends StatelessWidget {

  String image;

  BottomNavbarSelectedIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        height: 60.h,
        decoration: BoxDecoration(
            color: AppColor.backGround,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                spreadRadius: 5.r,
                blurRadius: 5.r,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(50.r)
        ),
        child:Image(
          image: AssetImage(image),
          width: 40.w,
          height: 40.h,
          color: AppColor.white,
        )) ;
  }
}
