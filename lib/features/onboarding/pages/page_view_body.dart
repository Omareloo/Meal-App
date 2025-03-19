import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_text_styles.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';
import 'package:meal_ware/features/onboarding/pages/page_four.dart';
import 'package:meal_ware/features/onboarding/pages/page_one.dart';
import 'package:meal_ware/features/onboarding/pages/page_three.dart';
import 'package:meal_ware/features/onboarding/pages/page_two.dart';
import 'package:meal_ware/features/onboarding/widget/custom_indicator.dart';

import '../../../config/style/app_color.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({super.key});

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 700.h,
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                children: const [PageOne(), PageTwo(), PageThree(), PageFour()],
              ),
            ),
            10.hs,
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AuthScreen()),);
                    },
                    child: Text(
                      _currentIndex == 3 ? "" : "Skip",
                      style: AppTextStyle.font18background700,
                    ),
                  ),
                  60.ws,
                  Row(
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CustomIndicator(active: _currentIndex == index),
                      ),
                    ),
                  ),
                  60.ws,
                  InkWell(
                    onTap: () {
                      if (_currentIndex < 3) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AuthScreen()),);
                      }
                    },
                    child: Text(
                      _currentIndex == 3 ? "Login" : "Next",
                      style: AppTextStyle.font18background700
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
