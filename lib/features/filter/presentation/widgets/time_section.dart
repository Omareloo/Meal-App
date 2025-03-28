import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_color.dart';
class TimeFilterWidget extends StatelessWidget {
  final String selectedTime;
  final Function(String) onSelect;

  const TimeFilterWidget({
    Key? key,
    required this.selectedTime,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> times = ["5min", "10min", "15min+"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Time",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700,color: AppColor.backGround)
        ),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 10.w,
          children: times.map((time) {
            bool isSelected = time == selectedTime;
            return GestureDetector(
              onTap: () => onSelect(time),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColor.backGround : Colors.white,
                  border: Border.all(color: AppColor.lightGrey2),
                  borderRadius: BorderRadius.circular(35.r),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color:isSelected ? Colors.white : AppColor.lightGrey3,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
