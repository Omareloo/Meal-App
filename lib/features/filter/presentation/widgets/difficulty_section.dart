import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_color.dart';
class DifficultyFilterWidget extends StatelessWidget {
  final String selectedDifficulty;
  final Function(String) onSelect;

  const DifficultyFilterWidget({
    Key? key,
    required this.selectedDifficulty,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> difficulties = ["Beginner", "Medium", "Chef"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Difficulty",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700,color: AppColor.backGround)
        ),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 10.w,
          children: difficulties.map((difficulty) {
            bool isSelected = difficulty == selectedDifficulty;
            return GestureDetector(
              onTap: () => onSelect(difficulty),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColor.backGround : Colors.white,
                  border: Border.all(color: AppColor.lightGrey2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  difficulty,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColor.lightGrey3,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}