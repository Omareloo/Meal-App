import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_ware/core/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ware/core/data/local/shared_preferences_service.dart';


import 'config/style/app_theme.dart';
import 'core/data/local/Profile/ProfileModel.dart';
import 'core/di/db_injection.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator(); // ✅ Setup dependencies
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());
  await getIt<SharedPreferencesHelper>().init();
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
