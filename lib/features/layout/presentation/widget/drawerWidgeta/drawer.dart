import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/layout/presentation/widget/drawerWidgeta/profileAndUserName.dart';
import 'package:meal_ware/features/layout/presentation/widget/drawerWidgeta/selectedDrawerPage.dart';
import 'package:meal_ware/features/layout/presentation/widget/drawerWidgeta/unselectedDrawerPage.dart';

import '../../../../../config/style/app_color.dart';

Drawer myDrawer({required int index}){
  return Drawer(
    backgroundColor: AppColor.white,
    child:Column(
      children: [
       ProfileAndUserName(image: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg", userName: "User Name"),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            index==0?SelectedDrawerPage(image:"assets/icons/Home.png", text: "Home"):UnselectedDrawerPage(image:"assets/icons/Home.png", text: "Home",index: 0,),
            index==1?SelectedDrawerPage(image:"assets/icons/fav.png", text: "Favorite"):UnselectedDrawerPage(image:"assets/icons/fav.png", text: "Favorite",index: 1,),
            index==2?SelectedDrawerPage(image:"assets/icons/profile.png", text: "Profile"):UnselectedDrawerPage(image:"assets/icons/profile.png", text: "Profile",index: 2,),
            index==3?SelectedDrawerPage(image:"assets/icons/setting.png", text: "Setting"):UnselectedDrawerPage(image:"assets/icons/setting.png", text: "Setting",index: 0,),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 16.w),
              child: Divider(
                height: 2.h,
                color: AppColor.grey,
              ),
            ),
            UnselectedDrawerPage(image:"assets/icons/logout.png", text: "Logout",index: 4,)
          ],
        )
      ],
    ),
  );
}