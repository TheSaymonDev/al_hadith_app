import 'package:al_hadith_app/reusables/colors.dart';
import 'package:al_hadith_app/reusables/utility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IntroHadith extends StatelessWidget {
  const IntroHadith({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CarouselSlider(
        items: List.generate(
          5,
              (index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(4.h),
                  Text(
                    introHadith,
                    style: myTextStyle.bodyMedium!.copyWith(color: whiteClr, height: 1.1, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '[সহিহ মুসলিম - ২৫৬৬]',
                    style: myTextStyle.bodyMedium!.copyWith(color: whiteClr),
                  ),
                  Gap(4.h),
                ],
              ),
        ),
        options: CarouselOptions(
            height: 200.h, autoPlay: true, viewportFraction: 1),
      ),
    );
  }
}
