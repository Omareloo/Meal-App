import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/home/presentation/manager/cubit.dart';
import 'package:meal_ware/features/home/presentation/manager/states.dart';
import 'package:meal_ware/features/home/presentation/widgets/ingredients_button.dart';
import 'package:meal_ware/features/home/presentation/widgets/searchBar.dart';
import 'package:meal_ware/features/home/presentation/widgets/topRecipeBar.dart';
import 'package:meal_ware/features/fav/presentation/widget/recipeItem.dart';
import 'package:meal_ware/features/search/presentation/pages/search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<HomeBloc>()..fetchMeals(), // ✅ Using GetIt
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SearchSection(onTap: () {   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );},),
              AddIngredientsButton(),
              TopRecipeBar(),

              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else if (state is HomeLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.meals.length,
                        itemBuilder: (context, index) {
                          final meal = state.meals[index];
                          return RecipeItem(

                            image: meal.imgUrl ?? "",
                            ingrednum: meal.ingredients?.length ?? 0,
                            itemName: meal.title ?? "Unknown",
                            time: meal.prepTime?.toString() ?? "0", // Ensure it's a string
                            tittle: meal.category ?? "Unknown",
                            meal: meal, // No error, works smoothly ✅
                            isFavorite: false, // ✅ Set initial favorite status (if applicable)
                          );
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
