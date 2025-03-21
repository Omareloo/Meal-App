import 'package:flutter/material.dart';
import 'package:meal_ware/core/data/local/shared_preferences_service.dart';
import 'package:meal_ware/core/di/db_injection.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';
import 'package:meal_ware/features/auth/presentation/widgets/auth_widgets/logo.dart';
import 'package:meal_ware/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();

    Future.delayed(const Duration(seconds: 5), () async {
      SharedPreferencesHelper helper = getIt<SharedPreferencesHelper>();
      bool isFirstTime = await helper.getIsFirstTime();
      if (isFirstTime) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(position: animation, child: const LogoWidget()),
      ),
    );
  }
}
