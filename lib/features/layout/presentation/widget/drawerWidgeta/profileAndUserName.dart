import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/style/app_color.dart';

class ProfileAndUserName extends StatelessWidget {

  String image ;

  String userName;

  ProfileAndUserName({required this.image,required this.userName});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:157.h ,
      width:303.w ,
      color: AppColor.backGround,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32.r,
              backgroundColor: AppColor.grey,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width: 16.w,),
            Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:TextStyle(
                  color: AppColor.white,
                  fontSize: 16.sp
              ),
            )
          ],
        ),
      ),
    );
  }
}
