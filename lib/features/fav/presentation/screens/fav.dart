import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/fav/managers/cubit.dart';
import 'package:meal_ware/features/fav/managers/state.dart';
import 'package:meal_ware/features/fav/presentation/widget/recipeItem.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';

class Fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FavoriteError) {
              return Center(child: Text(state.message));
            } else if (state is FavoriteLoaded) {
              final favoriteMeals = state.favorites;

              if (favoriteMeals.isEmpty) {
                return Center(child: Text("No favorites added yet!"));
              }

              return ListView.builder(
                itemCount: favoriteMeals.length,
                itemBuilder: (context, index) {
                  final meal = favoriteMeals[index];
                  return RecipeItem(
                    image: meal.imgUrl ?? "",
                    ingrednum: meal.ingredients?.length ?? 0,
                    itemName: meal.title ?? "Unknown",
                    time: meal.prepTime?.toString() ?? "0", // Ensure it's a string
                    tittle: meal.category ?? "Unknown",
                    meal: meal,
                    isFavorite: true, // Since we're in the favorites screen, it's always true
                  );
                },
              );
            }
            return Center(child: Text("No favorites found!"));
          },
        ),
      ),
    );
  }
}
