import 'package:flutter/material.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';

class Editprofilephoto extends StatelessWidget {

String image;

Editprofilephoto({required this.image});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 56.r,
                    backgroundImage: NetworkImage(image),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.backGround,
                    radius: 22.r,
                  child: IconButton(
                    onPressed: (){},
                     icon: Icon(
                      Icons.edit,
                      color: AppColor.white,
                      size: 24.sp,
                     )
                     ),
                  )
                ],
              );
  }
}