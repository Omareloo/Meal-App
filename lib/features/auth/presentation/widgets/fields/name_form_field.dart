import 'package:flutter/material.dart';
import '../../../../../config/style/app_color.dart';
import '../../../../../core/utils/heplers/validation_form.dart';

class UserNameFormField extends StatelessWidget {

  final TextEditingController userNameController = TextEditingController();
  UserNameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userNameController,
      style: TextStyle(
        color: AppColor.white,
      ),
      cursorColor: AppColor.white,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person,),
        prefixIconColor: AppColor.white,
        hintText: 'User Name',
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
      validator: ValidationForm.nameValidator,
    );
  }
}
