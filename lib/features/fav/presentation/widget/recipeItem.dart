import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_color.dart';

class RecipeItem extends StatelessWidget {

  String image ;

  int ingrednum;

  String time;

  String itemName;

  String tittle;

  RecipeItem({required this.image,required this.ingrednum,required this.itemName,required this.time,required this.tittle});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        border: Border.all(color:Colors.grey,width: 1.4.w),
      ),
      child:Padding(
        padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(image),
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tittle,
                  style: TextStyle(
                      color: AppColor.backGround,
                      fontSize: 15.sp
                  ),
                ),
                Text(
                  itemName,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.backGround
                  ),
                ) ,
                Row(
                  children: [
                    Text(
                      "$ingrednum ingrediantes",
                      style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 15.sp
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Text(
                      "$time min",
                      style: TextStyle(
                          color: AppColor.backGround,
                          fontSize: 18.sp
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 26.sp,
                )
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
