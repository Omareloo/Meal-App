import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/chat/presentation/pages/add_chat_indegraates.dart';

import '../../../../config/style/app_color.dart';

class AddIngredianteBuuton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
        onTap: (){
           Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddChatIndegraates()),
                  );
                

        },
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColor.backGround,
              borderRadius: BorderRadius.circular(30.r)
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
            child: Text(
              "add your ingrediantes",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
