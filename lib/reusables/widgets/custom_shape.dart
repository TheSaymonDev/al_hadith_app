import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShape extends StatelessWidget {
  final Color color;
  final String title;
  const CustomShape({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 70.h,
      child: ClipPolygon(
        sides: 6,
        borderRadius: 5.0.r,
        rotate: 60.0,
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: whiteClr),
          ),
        ),
      ),
    );
  }
}
