import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import '../../../../../config/style/app_color.dart';
import '../../../../../generated/assets.dart';


class FacebookGoogleWidget extends StatefulWidget {
  const FacebookGoogleWidget({super.key});

  @override
  State<FacebookGoogleWidget> createState() => _FacebookGoogleWidgetState();
}

class _FacebookGoogleWidgetState extends State<FacebookGoogleWidget> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        InkWell(
          onTap: (){},
          borderRadius:   BorderRadius.circular(66.r),
          splashColor: AppColor.blue,
          child: Container(
              height: 66.h,
              width: 66.w,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: AppColor.blue,
              ),
              alignment: Alignment.center,
              child: Image(image: AssetImage(Assets.imagesFacebook),width: 38.w,height: 38.h,)
          ),
        ),
        56.ws,
        InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(66.r),
          splashColor: AppColor.white,
          child: Container(
              height: 66.h,
              width: 66.w,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: AppColor.white,
              ),
              alignment: Alignment.center,
              child: Image(image: AssetImage(Assets.imagesGoogle),width: 38.w,height: 38.h,)
          ),
        )
      ],
    );
  }
}
