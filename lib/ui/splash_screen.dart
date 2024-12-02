import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            Image.asset(
              AppImages.co2,
              // width: 100,
              // height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80.w),
              child: Text(
                'Food Footprint',
                style: theme.headlineLarge?.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
