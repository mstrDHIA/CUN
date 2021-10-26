
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/login/login_screen.dart';

class IntroController extends GetxController {

 onDonePress(context){
   print("aaaaa");
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
}

}