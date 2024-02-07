import 'package:al_hadith_app/screens/collection_screen/collection_page.dart';
import 'package:al_hadith_app/screens/hadith_book_screen/hadith_book_page.dart';
import 'package:al_hadith_app/screens/home_screen/home_page_components/my_bottom_nav_bar.dart';
import 'package:al_hadith_app/screens/tahkick_screen/tahkick_page.dart';
import 'package:al_hadith_app/screens/topic_wise_hadith_screen/topic_wise_hadith_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _pages = [const HadithBookPage(), const TopicWiseHadithPage(), const TahkickPage(), const CollectionPage()];

  void _onTap(int index){
    _currentIndex= index;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: MyBottomNavBar(currentIndex: _currentIndex, onTap: _onTap,),
    );
  }
}