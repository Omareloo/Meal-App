import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/profile/presentation/widgets/editProfilePhoto.dart';
import 'package:meal_ware/features/profile/presentation/widgets/saveButton.dart';
import 'package:meal_ware/features/profile/presentation/widgets/textFormField.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Editprofilephoto(image: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg"),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  MyTextformfield(),
                  MyTextformfield(),
                  MyTextformfield(),
                  MyTextformfield(),
                  Savebutton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
