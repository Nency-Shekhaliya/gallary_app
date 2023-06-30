import 'package:flutter/material.dart';
import 'package:gallary_app/views/screens/home_page.dart';
import 'package:gallary_app/views/screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: "/", page: () => const Splash_screen()),
      GetPage(name: "/Home_Page", page: () => Home_Page()),
    ],
  ));
}
