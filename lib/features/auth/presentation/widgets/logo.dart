import 'package:flutter/material.dart';

import '../../../../config/style/app_color.dart';
import '../../../../generated/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: ShapeDecoration(
          shape: const CircleBorder(
            side: BorderSide(
              color: AppColor.white,
              width: 1,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Image(image: AssetImage(Assets.svgLogo))
    );
  }
}
