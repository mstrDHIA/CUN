import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            debugShowCheckedModeBanner: false,

      theme: themeData,
      home: SplashScreen(),
    );
  }
}
