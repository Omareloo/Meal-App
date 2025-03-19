import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/fav/presentation/widget/recipeItem.dart';

class Fav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: Column(
          children: [
            RecipeItem(
                image: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                ingrednum: 12,
                itemName: "italian pizza",
                time: "30",
                tittle: "vegan")
          ],
        ),
      ),
    );
  }
}
