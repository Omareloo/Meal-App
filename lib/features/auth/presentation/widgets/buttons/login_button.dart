import 'package:flutter/material.dart';

import '../../../../../config/style/app_color.dart';
import '../../../../../config/style/app_text_styles.dart';

class AppLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const AppLoginButton({super.key, required this.onPressed, this.isLoading = false});

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
      child: isLoading
          ? const CircularProgressIndicator()
          : Text('Login', style: AppTextStyle.font21background700),
      onPressed: isLoading ? null : onPressed,
    );
  }
}
