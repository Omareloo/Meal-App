import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/fav/managers/cubit.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

class RecipeItem extends StatelessWidget {
  final String image;
  final int ingrednum;
  final String time;
  final String itemName;
  final String tittle;
  final MealModel meal;
  final bool isFavorite;

  RecipeItem({
    required this.image,
    required this.ingrednum,
    required this.itemName,
    required this.time,
    required this.tittle,
    required this.meal,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        border: Border.all(color: Colors.grey, width: 1.4.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(image),
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tittle,
                  style: TextStyle(color: AppColor.backGround, fontSize: 15.sp),
                ),
                Text(
                  itemName,
                   overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.backGround,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "$ingrednum ingredients",
                      style: TextStyle(color: AppColor.grey, fontSize: 15.sp),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "$time min",
                      style: TextStyle(color: AppColor.backGround, fontSize: 18.sp),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                final favoriteCubit = context.read<FavoriteCubit>();
                if (isFavorite) {
                  favoriteCubit.removeFavorite("userId", meal.id!);
                } else {
                  favoriteCubit.addFavorite("userId", meal);
                }
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 26.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
