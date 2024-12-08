import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';

class ErrorScreen extends StatefulWidget {
  final VoidCallback onRefresh;
  const ErrorScreen({super.key, required this.onRefresh});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: body(theme: theme),
    );
  }

  Widget body({TextTheme? theme}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.error,
            height: 221.w,
          ),
          Text(
            'Try refreshing the page',
            style: theme?.titleSmall?.copyWith(color: AppColors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: widget.onRefresh,
            child: Container(
              width: 225.w,
              height: 36.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.primary,
              ),
              child: Center(
                  child: Text(
                'Refresh',
                style: theme?.headlineMedium
                    ?.copyWith(fontSize: 14, color: AppColors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
