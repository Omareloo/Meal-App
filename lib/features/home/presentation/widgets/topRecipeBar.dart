import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_color.dart';

class TopRecipeBar extends StatelessWidget {
  const TopRecipeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Text(
            "Top Recipes",
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.backGround,
                fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          Text(
            "see all",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColor.backGround,
            ),
          ),
        ],
      ),
    );
  }
}
