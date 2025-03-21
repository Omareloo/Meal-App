import 'package:flutter/material.dart';
import '../../../../../config/style/app_color.dart';
import '../../../../../config/style/app_text_styles.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        elevation: 0,
        minimumSize: const Size(300, 57),
      ),
      child: Text('Register', style: AppTextStyle.font21background700),
      onPressed: onPressed, // ✅ Pass the callback function
    );
  }
}
