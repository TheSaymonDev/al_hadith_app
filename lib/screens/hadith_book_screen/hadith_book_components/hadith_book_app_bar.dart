import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadithBookAppbar extends StatelessWidget {
  const HadithBookAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: whiteClr,
              size: 25.sp,
            )),
        Text(
          'আল হাদিস',
          style: myTextStyle.titleMedium!.copyWith(color: whiteClr),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: whiteClr,
              size: 25.sp,
            )),
      ],
    );
  }
}
