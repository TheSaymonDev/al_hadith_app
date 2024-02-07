import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularContainer extends StatelessWidget {

  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final Widget child;
  const CustomCircularContainer({super.key, this.height, this.padding, this.margin, this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.h,
      width: double.infinity.w,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(radius ?? 12.r),
        color: whiteClr
      ),
      child: child,
    );
  }
}
