import 'package:flutter/material.dart';
import '../../../../../config/style/app_color.dart';
import '../../../../../core/utils/heplers/validation_form.dart';

class PhoneFormField extends StatelessWidget {

    final TextEditingController phoneController = TextEditingController();
  PhoneFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      style: TextStyle(
        color: AppColor.white,
      ),
      cursorColor: AppColor.white,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person,),
        prefixIconColor: AppColor.white,
        hintText: 'phone',
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
      validator: ValidationForm.phoneValidator,
    );
  }
}
