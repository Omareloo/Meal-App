import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';
import 'package:meal_ware/features/auth/presentation/pages/verification_screen.dart';
import 'config/style/app_theme.dart';
import 'core/di/db_injection.dart';
import 'core/di/db_injection.dart' as DpInjection;


void main() async {
  await DpInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: VerificationScreen(),
      ),
    );
  }
}
