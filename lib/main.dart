import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/router/router.dart';
import 'package:food_footprint/theme/theme.dart';
import 'package:food_footprint/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ColorMatch Inventory',
          theme: lightTheme,
          home: const SplashScreen(),
          routes: routes,
        );
      },
    );
  }
}
