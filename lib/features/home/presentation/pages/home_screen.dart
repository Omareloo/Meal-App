import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meal_ware/features/home/presentation/widgets/ingredients_button.dart';
import 'package:meal_ware/features/home/presentation/widgets/searchBar.dart';
import 'package:meal_ware/features/home/presentation/widgets/topRecipeBar.dart';

import '../../../../config/style/app_color.dart';
import '../../../fav/presentation/widget/recipeItem.dart';
import '../../../search/presentation/pages/search_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              SearchSection(onTap: () {   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );},),
              AddIngredientsButton(),
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
