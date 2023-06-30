import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.toNamed("/Home_Page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 361,
        height: 712,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/camera.png",
                cacheHeight: 130,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 200,
              child: Text("Gallery App",
                  style: GoogleFonts.aladin(
                      fontSize: 30, color: Colors.white, letterSpacing: 3)),
            )
          ],
        ),
      ),
    );
  }
}
