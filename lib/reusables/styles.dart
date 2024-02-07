import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

InputDecoration textFieldStyle(String title) {
  return InputDecoration(
    suffixIcon: Icon(
      Icons.search,
      color: greyColor,
      size: 20.sp,
    ),
    hintText: title,
    filled: true,
    fillColor: whiteClr,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
  );
}

SpinKitFadingCircle customCircularProgressIndicator({required Color color}){
  return SpinKitFadingCircle(
    color: color,
    size: 50.0.r,
  );
}
