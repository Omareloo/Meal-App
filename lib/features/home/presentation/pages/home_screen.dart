import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/chat/presentation/pages/chat_page.dart';
import 'package:meal_ware/features/home/presentation/widgets/addingre.dart';
import 'package:meal_ware/features/home/presentation/widgets/topRecipeBar.dart';

import '../../../../config/style/app_color.dart';
import '../../../fav/presentation/widget/recipeItem.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SearchBar(),
            
                  AddIngredianteBuuton(),
              
              TopRecipeBar(),
              RecipeItem(
                image:
                    "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                ingrednum: 12,
                itemName: "italian pizza",
                time: "30",
                tittle: "vegan",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
