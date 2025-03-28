import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/style/app_color.dart';
import '../../../gemini_api/Presentation/pages/add_chat_indegraates.dart';

class AddIngredientsButton extends StatelessWidget {
  const AddIngredientsButton({super.key});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
        onTap: (){
           Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddChatIngredients()),
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
              "add your Ingredients",
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
