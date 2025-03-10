import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/routes/app_routes.dart';
import '../../db_injection.dart';
import '../data/local/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loading();
  }

  _loading() {
    Timer(const Duration(seconds: 3), () {
      if (sl<SharedPreferencesService>().token != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.auth, (_) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.auth, (_) => false);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}
