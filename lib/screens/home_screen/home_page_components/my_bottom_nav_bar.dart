import 'package:al_hadith_app/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: GNav(
            rippleColor: greenColor,
            hoverColor: Colors.grey[100]!,
            gap: 8.w,
            activeColor: greenColor,
            iconSize: 24.sp,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: greyColor,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.menu_book,
                text: 'Topic',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Shop',
              ),
              GButton(
                icon: Icons.bookmark_border,
                text: 'Collection',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: onTap,
          ),
        ),
      ),
    );
  }
}
