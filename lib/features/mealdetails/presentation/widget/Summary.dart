import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';

class SummaryCard extends StatelessWidget {
  final String summary;
  final List<Map<String, String>> nutrients; // List of nutrient data

  const SummaryCard({
    required this.summary,
    required this.nutrients,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          summary,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w500,
          ),
        ),
        20.hs,
        Text(
          "Nutrations",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.backGround,
            fontWeight: FontWeight.w700,
          ),
        ),
        10.hs,
        GridView.builder(
          shrinkWrap: true, // To prevent infinite height issue
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10, // Spacing between columns
            mainAxisSpacing: 10, // Spacing between rows
            childAspectRatio: 1, // Aspect ratio (adjust if needed)
          ),
          itemCount: nutrients.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.backGround, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nutrients[index]["label"]!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.backGround,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    nutrients[index]["value"]!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.backGround,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
