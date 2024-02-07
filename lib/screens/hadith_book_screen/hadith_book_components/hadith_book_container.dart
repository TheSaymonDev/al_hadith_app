import 'package:al_hadith_app/reusables/widgets/custom_circular_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadithBookContainer extends StatelessWidget {
  const HadithBookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomCircularContainer(
        height: 120.h,
        radius: 20.r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(myTextStyle: myTextStyle, iconUrl: 'assets/images/last.png', title: 'সর্বশেষ', onTap: (){}),
            _buildItem(myTextStyle: myTextStyle, iconUrl:  'assets/images/apps.png', title: 'অ্যাপস', onTap: (){}),
            _buildItem(myTextStyle: myTextStyle, iconUrl: 'assets/images/goto.png', title: 'হাদিসে যান', onTap: (){}),
            _buildItem(myTextStyle: myTextStyle, iconUrl:  'assets/images/sadaqa.png', title: 'সাদাকা', onTap: (){})
          ],
        ),
      ),
    );
  }

  GestureDetector _buildItem({required TextTheme myTextStyle, required String iconUrl, required String title, required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset(
                    iconUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(title, style: myTextStyle.titleSmall)
              ],
            ),
    );
  }
}
