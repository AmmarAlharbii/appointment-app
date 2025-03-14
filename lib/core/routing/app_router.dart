import 'package:appointment_app/core/di/dependency_injection.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/feature/home/view/home_view.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/feature/auth/login/view/login_screen.dart';
import 'package:appointment_app/feature/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const HomeView(),
                ));
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
