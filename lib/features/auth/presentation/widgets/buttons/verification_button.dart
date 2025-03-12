import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../config/style/app_color.dart';
import '../../../../../config/style/app_text_styles.dart';

class AppVerificationButton extends StatefulWidget {
  const AppVerificationButton({super.key});

  @override
  State<AppVerificationButton> createState() => _AppVerificationButtonState();
}

class _AppVerificationButtonState extends State<AppVerificationButton> {
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
        minimumSize:  Size(300, 57),
      ),
      child:  Text('Continue',style: AppTextStyle.font21background700,),
      onPressed: ()
      {
        setState(() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: SpinKitCircle(
                    color: AppColor.black,
                  ),
                  backgroundColor: AppColor.white,
                  content: Text(
                    textAlign: TextAlign.center,
                    'please wait', style: AppTextStyle.font16black400,),
                );
              }
          );
        });
      },
    );
  }
}
