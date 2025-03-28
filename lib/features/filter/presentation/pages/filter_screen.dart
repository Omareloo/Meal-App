import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';

import '../widgets/difficulty_section.dart';
import '../widgets/meal_section.dart';
import '../widgets/number_of_ingrediens_section.dart';
import '../widgets/time_section.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedMeal = "";
  String selectedTime = "";
  String selectedDifficulty = "";
  int numberOfIngredients = 0;

  void resetFilters() {
    setState(() {
      selectedMeal = "";
      selectedTime = "";
      selectedDifficulty = "";
      numberOfIngredients = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Filter", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700,color: AppColor.black)),
                Spacer(),
                GestureDetector(
                  onTap: resetFilters,
                  child: Text("Reset", style: TextStyle(fontSize: 16.sp, color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            MealFilterWidget(
              selectedMeal: selectedMeal,
              onSelect: (val) => setState(() => selectedMeal = val),
            ),
            SizedBox(height: 20.h),
            TimeFilterWidget(
              selectedTime: selectedTime,
              onSelect: (val) => setState(() => selectedTime = val),
            ),
            SizedBox(height: 20.h),
            DifficultyFilterWidget(
              selectedDifficulty: selectedDifficulty,
              onSelect: (val) => setState(() => selectedDifficulty = val),
            ),
            SizedBox(height: 20.h),
            NumberOfIngredientsWidget(
              value: numberOfIngredients,
              onChange: (val) => setState(() => numberOfIngredients = val),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      
      ),
    );
  }
}
