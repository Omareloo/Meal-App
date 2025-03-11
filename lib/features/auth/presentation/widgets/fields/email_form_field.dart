import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../../../config/style/app_color.dart';
import '../../../../../core/utils/heplers/validation_form.dart';

class EmailFormField extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(
        color: AppColor.white,
      ),
      cursorColor: AppColor.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email,),
        prefixIconColor: AppColor.white,
        hintText: 'Email',
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
      validator: (value)
      {
        if(value!.isNotEmpty) {
          return EmailValidator.validate(value) ?  null : 'Email must be correct';
        } else
        {
          return 'Email Can\'t be Empty';
        }
      },
    );
  }
}
