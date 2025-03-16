import 'package:appointment_app/core/di/dependency_injection.dart';
import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/doc_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await setupGetIt();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
  FlutterNativeSplash.remove();
}
