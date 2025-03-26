import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/home/presentation/pages/home_screen.dart';
import '../widget/BarView.dart';
import '../widget/TabBar.dart';

class UiMealDetails extends StatefulWidget {
  const UiMealDetails({super.key});

  @override
  _UiMealDetailsState createState() => _UiMealDetailsState();
}

class _UiMealDetailsState extends State<UiMealDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final List<Map<String, String>> nutrients = [
    {"value": "40g", "label": "protein"},
    {"value": "40g", "label": "carp"},
    {"value": "40g", "label": "fat"},
    {"value": "400", "label": "kcal"},
    {"value": "20mg", "label": "vitamenes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }, icon: const Icon(Icons.arrow_back_ios_new)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_outlined)),
        ],
      ),
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Image(
            image: const NetworkImage(
                "https://preppykitchen.com/wp-content/uploads/2021/07/Chicken-Shawarma-Recipe.jpg"),
          ),
          20.hs,
          Text(
            "Italian Pizza",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColor.black),
          ),
          10.hs,
          Text(
            "meat . 14min . 1 serving",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.lightGrey2),
          ),
          20.hs,
          ContainerTabBar(tabController: _tabController),
          BarView(tabController: _tabController, nutrients: nutrients),
        ],
      ),
    );
  }
}








