import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
 
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black, size: 24.sp),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black, size: 24.sp),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(child: Container()), 
              Padding(
                padding: EdgeInsets.all(16.w), 
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "   enter your ingrediantes and your goal ",
                    hintStyle: TextStyle(
                      color: Color(0xff767676),
                      fontSize: 12.sp, 
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r), // Responsive radius
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.w), 
                      child: Image.asset(
                        "assets/images/Mask group (4).png",
                        width: 24.w, 
                        height: 24.h, 
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
 
  }

