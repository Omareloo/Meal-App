import 'package:flutter/material.dart';
import 'package:meal_ware/core/extentions/size_extension.dart';

class MyTextformfield extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r)
                      )
                    ),
                  ),
    );
  }
}