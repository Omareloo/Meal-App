import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
import 'package:meal_ware/features/gemini_api/Presentation/Widgets/custom_food_card.dart';
import 'package:meal_ware/features/gemini_api/Presentation/cubit/gemini_cubit.dart';
import '../../../../core/di/db_injection.dart';
import '../cubit/gemini_states.dart';

class AddChatIngredients extends StatelessWidget {
  const AddChatIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>MealCubit(getIt(), getIt()),
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: AppColor.black, size: 24.sp),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: AppColor.black, size: 24.sp),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<MealCubit, MealState>(
          builder: (BuildContext context, MealState state) {
            var cubit = context.read<MealCubit>();
            if (state is MealLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MealError) {
              return Center(child: Text(state.message));
            }
            if (state is MealLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return FoodCard();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: TextField(
                      controller: cubit.ingredientsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,
                        hintText: "enter your ingredients and your goal ",
                        hintStyle: TextStyle(
                          color: Color(0xff767676),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ), // Responsive radius
                          borderSide: BorderSide(color: Color(0xffDEDEDE)),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            cubit.getMealAndImage(cubit.ingredientsController.text);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Image.asset(
                              "assets/images/Mask group (4).png",
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
            return Container();
          },
        ),
      )
    );
  }
}