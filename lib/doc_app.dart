import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: Routes.onBoarding,
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
