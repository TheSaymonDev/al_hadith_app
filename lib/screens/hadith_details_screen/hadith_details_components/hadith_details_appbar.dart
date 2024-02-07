import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HadithDetailsAppbar extends StatelessWidget {

  final String title;
  final String chapter;
  const HadithDetailsAppbar({super.key, required this.title, required this.chapter});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: whiteClr,
              size: 25.sp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: myTextStyle.titleMedium!.copyWith(color: whiteClr),
                ),
                Gap(8.h),
                Text(
                  chapter,
                  style: myTextStyle.bodyMedium!.copyWith(color: whiteClr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
