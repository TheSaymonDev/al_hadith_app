import 'package:al_hadith_app/models/hadith_model.dart';
import 'package:al_hadith_app/reusables/colors.dart';
import 'package:al_hadith_app/reusables/styles.dart';
import 'package:al_hadith_app/reusables/widgets/custom_bottom_sheet.dart';
import 'package:al_hadith_app/reusables/widgets/custom_shape.dart';
import 'package:al_hadith_app/screens/hadith_details_screen/hadith_details_components/hadith_details_appbar.dart';
import 'package:al_hadith_app/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HadithDetailsPage extends StatefulWidget {
  final int chapterId;
  final String chapter;
  final String bookName;
  final String abvrCode;
  final int bookId;

  const HadithDetailsPage({
    super.key,
    required this.chapterId,
    required this.chapter,
    required this.bookName,
    required this.abvrCode,
    required this.bookId,
  });

  @override
  State<HadithDetailsPage> createState() => _HadithDetailsPageState();
}

class _HadithDetailsPageState extends State<HadithDetailsPage> {
  late Future<List<HadithModel>> hadithFuture;

  @override
  void initState() {
    super.initState();
    hadithFuture = getHadithByChapterAndBookId(widget.chapterId, widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: greenColor,
      body: FutureBuilder(
        future: hadithFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: SizedBox(
                height: double.infinity.h,
                width: double.infinity.w,
                child: Column(
                  children: [
                    HadithDetailsAppbar(
                        title: widget.bookName, chapter: widget.chapter),
                    Expanded(
                      child: Container(
                        height: double.infinity.h,
                        width: double.infinity.w,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: bgGreyColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r),
                          ),
                        ),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Gap(16.h),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 16.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: whiteClr),
                                    child: Text(
                                      '${widget.chapterId}/${index + 1} Chapter:',
                                      style: myTextStyle.titleMedium!
                                          .copyWith(color: greenColor),
                                    ),
                                  ),
                                  Gap(8.h),
                                  Container(
                                    width: double.infinity.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: whiteClr),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomShape(
                                                color: greenColor,
                                                title: widget.abvrCode),
                                            Gap(8.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      style: myTextStyle
                                                          .titleMedium,
                                                      text: 'Hadith No: ',
                                                      children: [
                                                        TextSpan(
                                                            style: myTextStyle
                                                                .titleMedium!
                                                                .copyWith(
                                                                    color:
                                                                        greenColor),
                                                            text:
                                                                "${index + 1}"),
                                                      ]),
                                                ),
                                                Text(
                                                  widget.bookName,
                                                  style: myTextStyle.bodyMedium!
                                                      .copyWith(
                                                          color: greyColor),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w,
                                                  vertical: 8.h),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  color: greenColor),
                                              child: Text(
                                                '${snapshot.data![index].grade}',
                                                style: myTextStyle.bodySmall!
                                                    .copyWith(color: whiteClr),
                                              ),
                                            ),
                                            Gap(16.w),
                                            GestureDetector(
                                              onTap: () {
                                                showBottomSheet(myTextStyle);
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/vectors/option.svg'),
                                            ),
                                          ],
                                        ),
                                        Gap(16.h),
                                        Text(
                                          '${snapshot.data![index].ar}',
                                          style: TextStyle(
                                              fontSize: 22.sp,
                                              fontWeight: FontWeight.normal,
                                              color: blackClr,
                                              fontFamily: 'me_quran Regular',
                                              height: 1.8),
                                          textAlign: TextAlign.right,
                                        ),
                                        Gap(16.h),
                                        Text(
                                          '${snapshot.data![index].narrator} থেকে বর্ণিতঃ ',
                                          style: myTextStyle.bodyMedium!
                                              .copyWith(color: greenColor),
                                        ),
                                        Gap(16.h),
                                        Text(
                                          '${snapshot.data![index].bn}',
                                          style: myTextStyle.bodyMedium,
                                        ),
                                        Gap(16.h),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Gap(10.h),
                            itemCount: snapshot.data!.length),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong ${snapshot.error}'),
            );
          } else {
            return Center(
              child: customCircularProgressIndicator(color: whiteClr),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> showBottomSheet(TextTheme myTextStyle) {
    return Get.bottomSheet(
      CustomBottomSheet(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'More Option',
              style: myTextStyle.titleMedium,
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  size: 25.sp,
                  color: greyColor,
                )),
          ],
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v1.svg'),
              Gap(16.w),
              Text(
                'Go To Main Hadith',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v2.svg'),
              Gap(16.w),
              Text(
                'Add to Collection',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v3.svg'),
              Gap(16.w),
              Text(
                'Bangla Copy',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v3.svg'),
              Gap(16.w),
              Text(
                'English Copy',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v3.svg'),
              Gap(16.w),
              Text(
                'Arabic Copy',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v4.svg'),
              Gap(16.w),
              Text(
                'Add Hifz',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v4.svg'),
              Gap(16.w),
              Text(
                'Add Note',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v5.svg'),
              Gap(16.w),
              Text(
                'Share',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/v6.svg'),
              Gap(16.w),
              Text(
                'Report',
                style: myTextStyle.bodyMedium,
              )
            ],
          ),
        ),
        Gap(16.h),
      ]),
    );
  }

}
