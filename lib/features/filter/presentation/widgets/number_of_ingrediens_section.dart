import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/config/style/app_color.dart';

class NumberOfIngredientsWidget extends StatefulWidget {
  final int value;
  final Function(int) onChange;

  const NumberOfIngredientsWidget({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  _NumberOfIngredientsWidgetState createState() => _NumberOfIngredientsWidgetState();
}

class _NumberOfIngredientsWidgetState extends State<NumberOfIngredientsWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of \nIngredients",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.backGround,
          ),
        ),
        SizedBox(width: 50.w),
        Container(
          width: 87.w,
          height: 49.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isFocused ? AppColor.backGround : AppColor.lightGrey2, // Change color based on focus
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            focusNode: _focusNode, // Attach focus node
            keyboardType: TextInputType.number, // Allow only numbers
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: AppColor.lightGrey3),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "0",
              hintStyle: TextStyle(color: AppColor.lightGrey3),
            ),
            onChanged: (text) {
              int newValue = int.tryParse(text) ?? 0;
              widget.onChange(newValue);
            },
          ),
        ),
      ],
    );
  }
}
