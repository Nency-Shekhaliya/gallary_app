import 'package:flutter/material.dart';
import 'package:gallary_app/views/screens/categories_page.dart';
import 'package:gallary_app/views/screens/top_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modal/global_color.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int currentindex = 0;
  final List screens = [
    Top_image_page(),
    Categories_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Global.bottomcolor,
        selectedIconTheme: IconThemeData(
          color: Global.textcolor,
        ),
        currentIndex: currentindex,
        elevation: 20,
        iconSize: 25,
        selectedFontSize: 12,
        selectedLabelStyle:
            GoogleFonts.alegreya(fontSize: 14, fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Global.textcolor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.vertical_align_top_outlined),
            label: "Top",
            activeIcon: Icon(Icons.vertical_align_top_outlined),
            backgroundColor: Global.textcolor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
              activeIcon: Icon(Icons.category),
              backgroundColor: Color(0xffE12E4B)),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
