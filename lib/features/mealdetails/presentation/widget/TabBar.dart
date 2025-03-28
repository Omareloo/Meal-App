import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
class ContainerTabBar extends StatelessWidget {
  const ContainerTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322.w,
      height: 50.h,
      child: TabBar(
        controller: _tabController,
        labelColor: AppColor.backGround,
        unselectedLabelColor: AppColor.lightGrey2,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: AppColor.backGround),
          insets: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        tabs: [
          Tab(text: "Summary"),
          Tab(text: "Ingredients"),
          Tab(text: "Directions"),
        ],
      ),
    );
  }
}