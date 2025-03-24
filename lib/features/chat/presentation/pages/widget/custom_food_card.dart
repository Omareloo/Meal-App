import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                "assets/images/Mask group (5).png",
                width: 283.w,
                height: 133.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 7.h),

            Text(
              "Shawarma",
              style: TextStyle(fontSize: 22.9.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  "10 ingredients",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff8A8A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "14min",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.backGround,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
