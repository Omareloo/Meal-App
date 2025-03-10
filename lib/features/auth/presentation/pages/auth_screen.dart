import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ware/config/style/app_color.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: ShapeDecoration(
                shape: const CircleBorder(
                  side: BorderSide(
                    color: AppColor.white,
                    width: 2,
                  ),
                ),
              ),
              child: SvgPicture.asset('assets/images/logo.svg'),
              alignment: Alignment.center,

            )
          ],
        ),
      ),
    );
  }
}
