import 'package:flutter/material.dart';
import 'package:meal_ware/features/onboarding/pages/page_view_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewBody(),
    );
  }
}