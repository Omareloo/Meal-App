import 'package:flutter/material.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/logo.dart';

import '../../../config/style/app_text_styles.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/Rectangle 687.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(child: LogoWidget()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 230),
                  child: Center(
                    child: Image.asset(
                      "assets/images/Ellipse 7.png",
                      width: 280.w,
                      height: 280.h,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Center(
                    child: Image.asset(
                      "assets/images/Mask.png",
                      width: 230.w,
                      height: 230.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              'Like in a Restaurant but at Home',
              textAlign: TextAlign.center,
              style: AppTextStyle.font18background700
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.",
              textAlign: TextAlign.center,
              style: AppTextStyle.font18background700
            ),
          ),
        ],
      ),
    );
  }
}
