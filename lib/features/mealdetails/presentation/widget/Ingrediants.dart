import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';

class IngrediantsCard extends StatelessWidget {
  final String name;
  final String quantity;
  const IngrediantsCard({
    required this.name,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total ingredients: 15",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColor.backGround)),
        20.hs,
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.backGround,
                        ),
                      ),
                      Spacer(),
                      Text(
                        quantity,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.backGround,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColor.backGround,
                  thickness: 1.2,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
