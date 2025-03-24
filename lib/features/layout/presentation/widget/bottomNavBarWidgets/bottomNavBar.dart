import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/layout/presentation/manager/cubit.dart';
import 'package:meal_ware/features/layout/presentation/manager/states.dart';

import '../../../../../config/style/app_color.dart';
import 'bottomNavBarSelectedIcon.dart';
import 'bottomNavBarUnselectedIcon.dart';

Widget myBottomNavigationBar({required int index,required context}){
  return BottomNavigationBar(
      currentIndex:LayoutCubit.get(context).currentIndex,
      onTap: (value){
        LayoutCubit.get(context).changeScreen(index: value);
      },
      items: [
        BottomNavigationBarItem(
            icon:index ==0? BottomNavbarSelectedIcon(image:"assets/icons/Home.png"):BottomNavBarUnselectedIcon(image: "assets/icons/Home.png"),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon:index==1? BottomNavbarSelectedIcon(image:"assets/icons/fav.png"):BottomNavBarUnselectedIcon(image: "assets/icons/fav.png"),
            label: "Favorite"
        ),
        BottomNavigationBarItem(
            icon: index ==2?BottomNavbarSelectedIcon(image:"assets/icons/profile.png"):BottomNavBarUnselectedIcon(image: "assets/icons/profile.png"),
            label: "Profile"
        )
      ]
  );
}