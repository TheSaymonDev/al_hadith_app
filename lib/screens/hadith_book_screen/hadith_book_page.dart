import 'package:al_hadith_app/reusables/colors.dart';
import 'package:al_hadith_app/reusables/styles.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_components/hadith_book_list.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_components/hadith_book_app_bar.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_components/hadith_book_bg.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_components/hadith_book_container.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_components/intro_hadith.dart';
import 'package:al_hadith_app/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HadithBookPage extends StatefulWidget {
  const HadithBookPage({super.key});

  @override
  State<HadithBookPage> createState() => _HadithBookPageState();
}

class _HadithBookPageState extends State<HadithBookPage> {
  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: greenColor), // Set green status bar
      child: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const HadithBookBg(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HadithBookAppbar(),
                    Gap(32.h),
                    const IntroHadith(),
                    Gap(32.h),
                    const HadithBookContainer(),
                    Gap(32.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'সব হাদিসের বই',
                        style: myTextStyle.titleMedium,
                      ),
                    ),
                    Gap(8.h),
                    FutureBuilder<List<Map>>(
                      future: getBooks(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HadithBookList(books: snapshot.data);
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error fetching books: ${snapshot.error}'));
                        } else {
                          return Center(child: customCircularProgressIndicator(color: greenColor));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
