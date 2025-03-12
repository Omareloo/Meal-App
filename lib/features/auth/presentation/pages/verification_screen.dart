import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meal_ware/config/style/app_text_styles.dart';
import 'package:meal_ware/core/extentions/extention.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/logo.dart';

import '../../../../config/style/app_color.dart';
import '../widgets/buttons/verification_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(),
            16.hs,
            Text("Verification",style: AppTextStyle.font24white700,),
            16.hs,
            Text(
              'Enter 4 digits verification code. we just sent you to 01222222222',
              style: AppTextStyle.font16white400,
            ),
            32.hs,
            OtpTextField(
              numberOfFields: 4,
              fillColor: AppColor.white,
              filled: true,
              borderColor: AppColor.white,
              borderWidth: 2.0,
              fieldWidth: 60.0,
              keyboardType: TextInputType.number,
              borderRadius: BorderRadius.circular(10),
              textStyle: AppTextStyle.font24black700,
              showFieldAsBox: true,
            ),
            32.hs,
            AppVerificationButton(),
          ],
        ),
      )
    );
  }
}
