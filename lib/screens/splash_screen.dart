import 'dart:async';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/screens/intro/intro_screen.dart';
import 'package:grocery_app/screens/test_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/login/login_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

class SplashScreen extends StatelessWidget{
  // void initState() {
  //   super.initState();
    final HomeController homecontrol = Get.put(HomeController());

  //   const delay = const Duration(seconds: 3);
  //   Future.delayed(delay, () => onTimerFinished());
  // }

  

  @override
  Widget build(BuildContext context) {
    homecontrol.FirebaseInitialize();

        const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished(context,homecontrol));
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}



Future<void> onTimerFinished(context,HomeController control)  {
   
    
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return IntroScreen();
      },
    ));
  }

Widget splashScreenIcon() {
  String iconPath = "assets/icons/splash_screen_icon.svg";
  return SvgPicture.asset(
    iconPath,
  );
}
