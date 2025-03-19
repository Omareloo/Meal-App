import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/layout/presentation/manager/cubit.dart';

import '../../../../../config/style/app_color.dart';

class UnselectedDrawerPage extends StatelessWidget {

  String text;

  String image;

  int index;
  UnselectedDrawerPage({required this.text,required this.image,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        LayoutCubit.get(context).changeScreen(index: index);
      },
      child: Padding(
          padding:EdgeInsets.only(top: 30.h,right: 20.w,left: 16.w),
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                width: 40.w,
                height: 40.h,
                color: AppColor.backGround,
              ),
              SizedBox(width: 10.w,),
              Text(
                text,
                style: TextStyle(
                    color: AppColor.backGround,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                ),
              )
            ],
          )
      ),
    );
  }
}
