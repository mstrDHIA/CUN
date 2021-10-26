import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/screens/home/home_screen.dart';

class TestScreen extends StatelessWidget{
        final HomeController homecontrol = Get.put(HomeController());
        final UserController usercontrol = Get.put(UserController());


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
      child: FloatingActionButton(onPressed: () async { 
        print("blabla");
            usercontrol.facebookSignin(context);
                print("blabla");

        // if(newUser!=null){
        //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        //     return HomeScreen();
        //   }));
        // }
       },
      child: Icon(FontAwesomeIcons.facebookF),
      ),
    ),
    ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}