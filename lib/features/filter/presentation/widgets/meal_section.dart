import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
class MealFilterWidget extends StatelessWidget {
  final String selectedMeal;
  final Function(String) onSelect;

  const MealFilterWidget({
    Key? key,
    required this.selectedMeal,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> meals = ["Breakfast", "Lunch", "Dinner", "Drink", "Dessert", "Snacks"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Meal", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700,color: AppColor.backGround)),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: meals.map((meal) {
            bool isSelected = meal == selectedMeal;
            return GestureDetector(
              onTap: () => onSelect(meal),
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColor.backGround : Colors.white,
                  border: Border.all(color: AppColor.lightGrey2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  meal,
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
