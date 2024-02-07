import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HadithBookBg extends StatelessWidget {
  const HadithBookBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r)),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r)),
            child: Image.asset(
              'assets/images/Union.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: Lottie.asset(
              height: 100.h,
              'assets/images/anim.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: Lottie.asset(
              'assets/images/birds_bg.json',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
