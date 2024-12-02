import 'package:flutter/material.dart';
import 'package:food_footprint/base/colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontSize: 24,
      fontFamily: "Lato",
    ),
    titleMedium: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
      fontFamily: "Lato",
    ),
    titleSmall: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: "Lato",
    ),
  ),
);
