import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';

class Savebutton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Padding(
                    padding:EdgeInsets.symmetric(vertical: 10.h),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColor.backGround,
                          borderRadius: BorderRadius.circular(14.r)
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ;
  }
}