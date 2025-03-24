import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../config/style/app_color.dart';







class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  bool _isPressed = true;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey,width: 1.4.w),
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColor.black,
              size: 24.sp,
            ),
            SizedBox(width: 10.w,),
            InkWell(
              onTap: (){},
              child: Text(
                "Search Recipes",
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Spacer(),

           
            IconButton(
              onPressed: _showFilterSheet,
              icon: ImageIcon(
              AssetImage("assets/icons/filter.png"),
                color: _isPressed?AppColor.backGround:AppColor.grey,

            ),

            )
          ],
        ),
      ),
    );
  }


  _showFilterSheet() {

    showModalBottomSheet(
      isScrollControlled: true,
        context: context
        , builder:(context)=>FilterScreen(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
    );
setState(() {
  _isPressed = !_isPressed;
});
  }


}
