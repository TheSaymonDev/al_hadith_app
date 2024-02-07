import 'package:al_hadith_app/models/chapters_model.dart';
import 'package:al_hadith_app/reusables/colors.dart';
import 'package:al_hadith_app/reusables/styles.dart';
import 'package:al_hadith_app/reusables/widgets/custom_circular_container.dart';
import 'package:al_hadith_app/reusables/widgets/custom_shape.dart';
import 'package:al_hadith_app/screens/hadith_chapter_screen/hadith_chapter_components/hadith_chapter_appbar.dart';
import 'package:al_hadith_app/screens/hadith_details_screen/hadith_details_page.dart';
import 'package:al_hadith_app/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HadithChapterPage extends StatefulWidget {
  final int bookId;
  final int numberOfHadith;
  final String title;
  final String abvrCode;
  const HadithChapterPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.numberOfHadith,
    required this.abvrCode,
  });

  @override
  State<HadithChapterPage> createState() => _HadithChapterPageState();
}

class _HadithChapterPageState extends State<HadithChapterPage> {
  late Future<List<ChapterModel>> chaptersFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chaptersFuture = getChaptersByBookId(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: greenColor,
      body: FutureBuilder<List<ChapterModel>>(
        future: chaptersFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: SizedBox(
                height: double.infinity.h,
                width: double.infinity.w,
                child: Column(
                  children: [
                    HadithChapterAppbar(
                      title: widget.title,
                      numberOfHadith: widget.numberOfHadith,
                    ),
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
                        child: Column(
                          children: [
                            Gap(16.h),
                            TextField(
                              cursorColor: blackClr,
                              style: myTextStyle.bodyMedium,
                              decoration: textFieldStyle('Search by chapter'),
                            ),
                            Gap(16.h),
                            Expanded(
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => HadithDetailsPage(
                                              chapterId: snapshot
                                                  .data![index].chapterId,
                                              chapter:
                                                  '${snapshot.data![index].title}',
                                              bookName: widget.title,
                                              abvrCode: widget.abvrCode,
                                              bookId: widget.bookId,
                                            ),
                                          );
                                        },
                                        child: CustomCircularContainer(
                                          margin: EdgeInsets.only(bottom: 16.h),
                                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                                          child: Row(
                                            children: [
                                              CustomShape(
                                                  color: greenColor,
                                                  title: '${index + 1}'),
                                              Gap(32.w),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${snapshot.data![index].title}',
                                                      style: myTextStyle
                                                          .bodyMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Gap(8.h),
                                                    Text(
                                                      'হাদিসের রেঞ্জঃ ${snapshot.data![index].hadisRange}',
                                                      style: myTextStyle
                                                          .bodySmall!
                                                          .copyWith(
                                                              color: greyColor),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data!.length))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return Center(
                child: customCircularProgressIndicator(color: whiteClr));
          }
        },
      ),
    );
  }
}
