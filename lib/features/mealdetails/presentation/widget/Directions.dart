import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';

class DirectionCard extends StatelessWidget {
  final String step1;
  final String step2;

  const DirectionCard({
    required this.step1,
    required this.step2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total steps 15 ",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColor.backGround)),
        20.hs,
        Text(
          "Step1",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w700,
          ),
        ),
        10.hs,
        Text(
          step1,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w500,
          ),
        ),
        20.hs,
        Text(
          "Step2",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w700,
          ),
        ),
        10.hs,
        Text(
          step1,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
