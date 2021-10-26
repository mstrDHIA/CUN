import 'dart:async';
import 'dart:convert';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/models/user.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/screens/dashboard/navigator_item.dart';
import 'package:grocery_app/screens/dashboard/owner_dashboard_screen.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

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



Future<void> onTimerFinished(context,HomeController control)  async {

     SharedPreferences prefs = await SharedPreferences.getInstance();
  
  
     bool logged = (prefs.getBool('isLogged') ?? false);
          bool ownerLogged = (prefs.getBool('isOwnerLogged') ?? false);

     if(logged){
       Map<String,dynamic> usermap=jsonDecode(prefs.getString("user"));
       usercontrol.loggeduser=User(email:usermap['email'],firstName:usermap['name'],photo:usermap['photo'] );
       print("my name is "+usercontrol.loggeduser.firstName);
       usercontrol.update();
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return DashboardScreen();
      },
    ));
     }
      else if(ownerLogged){
        String storeString=prefs.getString('ownerStore');
        Map<String, dynamic> storeMap = jsonDecode(storeString);
Store store = Store.fromJson(storeMap);
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return OwnerDashboardScreen(store: store,);
      },
    ));
     }
     else{
 Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return IntroScreen();
      },
    ));
     }
   
  }

Widget splashScreenIcon() {
  String iconPath = "assets/images/logo_colors-02.png";
  return Image.asset(
    iconPath,
  );
}
