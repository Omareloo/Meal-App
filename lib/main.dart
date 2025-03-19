import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/core/screens/splash_screen.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';

import 'package:meal_ware/features/auth/presentation/pages/verification_screen.dart';
import 'package:meal_ware/features/layout/presentation/pages/layout_screen.dart';

import 'config/style/app_theme.dart';
import 'core/di/db_injection.dart';
import 'package:flutter/foundation.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // ✅ Fix for Web
  );
  await setupServiceLocator(); // ✅ Setup dependencies
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

        home: SplashScreen(),


      ),
    );
  }
}
