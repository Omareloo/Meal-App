import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
import 'package:meal_ware/features/gemini_api/Presentation/cubit/gemini_cubit.dart';
import 'package:meal_ware/features/gemini_api/Presentation/cubit/gemini_states.dart';
class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit,MealState>(
      builder:  (context, state) {
        if (state is MealLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MealError) {
          return Center(child: Text(state.message));
        }
        if (state is MealLoaded) {
          final aiMeal = state.aiMeal;
          final image = state.image;
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
                  child: Image.network(
                    image.imageUrl, // Corrected line: Use image.imageUrl
                    width: 283.w,
                    height: 133.h,
                    fit: BoxFit.cover,
                    errorBuilder: (
                        context,
                        error,
                        stackTrace
                        ) => Image.asset("assets/images/Mask group (5).png",
                      width: 283.w,
                      height: 133.h,
                      fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  aiMeal.name,
                  style: TextStyle(fontSize: 22.9.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "${aiMeal.ingredients.length} ingredients",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff8A8A8A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "${aiMeal.cookTime} min",
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
        return Container();
      },
    );
  }
}