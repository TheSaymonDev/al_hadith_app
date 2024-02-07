import 'package:al_hadith_app/reusables/colors.dart';
import 'package:al_hadith_app/reusables/widgets/custom_circular_container.dart';
import 'package:al_hadith_app/reusables/widgets/custom_shape.dart';
import 'package:al_hadith_app/screens/hadith_chapter_screen/hadith_chapter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HadithBookList extends StatelessWidget {
  final List<Map<dynamic, dynamic>>? books;
  const HadithBookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String hexClr = books![index]["color_code"];
            Color color = Color(
                int.parse(hexClr.substring(1, 7), radix: 16) + 0xFF000000);
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => HadithChapterPage(
                    bookId: books![index]["id"],
                    numberOfHadith: books![index]["number_of_hadis"],
                    title: books![index]["title"],
                    abvrCode: books![index]["abvr_code"],
                  ),
                );
              },
              child: CustomCircularContainer(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
                child: Row(
                  children: [
                    CustomShape(
                        color: color, title: books![index]["abvr_code"]),
                    Gap(32.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          books![index]["title"],
                          style: myTextStyle.bodyMedium,
                        ),
                        Gap(8.h),
                        Text(
                          books![index]["book_name"],
                          style:
                              myTextStyle.bodySmall!.copyWith(color: greyColor),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          books![index]["number_of_hadis"].toString(),
                          style: myTextStyle.bodyMedium,
                        ),
                        Gap(4.h),
                        Text(
                          'হাদিস',
                          style:
                              myTextStyle.bodySmall!.copyWith(color: greyColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: books!.length),
    );
  }
}
