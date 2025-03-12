import 'package:flutter/material.dart';
import 'package:meal_ware/core/utils/heplers/validation_form.dart';

import '../../../../../config/style/app_color.dart';


class PasswordFormField extends StatefulWidget {
  final TextEditingController passwordController = TextEditingController();
   PasswordFormField({super.key,});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      style: TextStyle(
        color: AppColor.white,
      ),
      obscureText:  _isPassword,
      obscuringCharacter: '*',
      cursorColor: AppColor.white,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock,),
        prefixIconColor: AppColor.white,
          suffixIcon:  IconButton(
            icon: Icon(
                _isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
            ),
            onPressed: ()
            {
              setState(() {
                _isPassword = !_isPassword;
              });
            },
          ),
        suffixIconColor:  AppColor.white,
        hintText: 'Password',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColor.white,
          ),
        ),
        fillColor: AppColor.backGround,
        hintStyle: TextStyle(
          color: AppColor.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColor.white,
          ),
        ),
      ),
      validator: ValidationForm.passwordValidator,
    );
  }
}
