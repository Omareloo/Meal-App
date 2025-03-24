import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
import 'package:meal_ware/features/layout/presentation/manager/cubit.dart';
import 'package:meal_ware/features/layout/presentation/widget/bottomNavBarWidgets/bottomNavBar.dart';
import 'package:meal_ware/features/layout/presentation/widget/drawerWidgeta/drawer.dart';
import '../manager/states.dart';

class LayoutScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder:(context,state){
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: AppBar(
              backgroundColor: AppColor.white,
              leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon:Icon(
                        Icons.menu,
                        color: AppColor.backGround,
                        size: 26.sp,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }
              ),
              actions: [
                IconButton(
                  icon:Icon(
                    Icons.notifications,
                    color: AppColor.backGround,
                    size: 26.sp,
                  ),
                  onPressed: () {},
                )],),
            body:cubit.screens[cubit.currentIndex],
            drawer: myDrawer(index: cubit.currentIndex),
            bottomNavigationBar: myBottomNavigationBar(index: cubit.currentIndex,context: context),
          );
        }
      ),
    );
  }
}
