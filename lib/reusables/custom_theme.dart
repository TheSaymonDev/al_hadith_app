import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData customThemeStyle = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: whiteClr,
    elevation: 0,
  ),
  scaffoldBackgroundColor: bgGreyColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 25.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodySmall: TextStyle(
      fontSize: 15.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleLarge: TextStyle(
      fontSize: 25.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
  ),
);
