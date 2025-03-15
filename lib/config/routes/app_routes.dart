import 'package:flutter/material.dart';
import 'package:meal_ware/features/auth/presentation/pages/register_screen.dart';

import '../../features/auth/presentation/pages/auth_screen.dart';

class AppRoute {
  static const String auth = "/auth";

  static const String register = "/register";
  


  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
        case auth:
          return _animateRouteBuilder(const AuthScreen(), x: 0, y: 1);
        case register:
          return _animateRouteBuilder(const RegisterScreen(), x: 0, y: 1);
        default:
          return MaterialPageRoute(builder: (_) => const AuthScreen());
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static Future pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  static Future pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static pop<T>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

  static _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) =>
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => to,
          opaque: false,
          transitionDuration: const Duration(milliseconds: 150),
          reverseTransitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (context, animation, animationTime, child) {
            final tween = Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));
            final tween2 = Tween<double>(
              begin: 0,
              end: 1,
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation.drive(tween2),
                child: child,
              ),
            );
          });
}
