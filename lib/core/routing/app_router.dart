import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/feature/login/view/login_screen.dart';
import 'package:appointment_app/feature/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    print("settings.arguments.toString()");
    print(settings.arguments.toString());
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
