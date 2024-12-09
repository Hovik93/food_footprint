import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/router/router.dart';
import 'package:food_footprint/theme/theme.dart';
import 'package:food_footprint/ui/splash_screen.dart';
import 'package:food_footprint/ui/widgets/error_screen.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exception.toString().contains('A RenderFlex overflowed')) {
      FlutterError.dumpErrorToConsole(details);
      return;
    }

    ErrorHandler.showErrorScreen();
  };

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stackTrace) {
    if (!error.toString().contains('A RenderFlex overflowed')) {
      ErrorHandler.showErrorScreen();
    } else {
      debugPrint('Игнорируем RenderFlex overflow: $error');
    }
  });
}

class ErrorHandler {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void showErrorScreen() {
    runApp(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: const ErrorScreen(
          onRefresh: restartApp,
        ),
      ),
    );
  }

  static void restartApp() {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Footprint',
          theme: lightTheme,
          home: const SplashScreen(),
          routes: routes,
        );
      },
    );
  }
}
