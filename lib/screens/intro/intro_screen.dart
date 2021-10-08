import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/intro_controller.dart';
import 'package:grocery_app/screens/login/login_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/intro_widgets.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatelessWidget{
          final IntroController introcontrol = Get.put(IntroController());

    List<Slide> slides = [
      Slide(
        marginTitle: EdgeInsets.only(top:100,bottom: 0),
        marginDescription: EdgeInsets.only(top:20,left: 30,right: 30),
        styleTitle: TextStyle(color: AppColors.primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.w800
        ),
        styleDescription: TextStyle(color: Colors.black,
        fontSize: 20),
        title: "Welcome",
        description: "Welcome to the CUN your first and best guide in the North Urban Center",
        pathImage: "assets/images/Hello-rafiki.png",
        heightImage: 400,
        backgroundColor: Colors.white,
      ),
       Slide(
        title: "Discover",
        marginTitle: EdgeInsets.only(top:100,bottom: 0),
        marginDescription: EdgeInsets.only(top:20,left: 30,right: 30),
        
        
               styleTitle: TextStyle(color: AppColors.primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.w800
        ),
        styleDescription: TextStyle(color: Colors.black,
        fontSize: 20),
        description: "Discover all the places in the area associated with its services, contact and info",
        pathImage: "assets/images/Business decisions-cuate.png",
         heightImage: 400,
        backgroundColor: Colors.white,
      ),
      Slide(
        title: "Promotions",
        marginTitle: EdgeInsets.only(top:100,bottom: 0),
               styleTitle: TextStyle(color: AppColors.primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.w800
        ),
        styleDescription: TextStyle(color: Colors.black,
        fontSize: 20),
        marginDescription: EdgeInsets.only(top:20,left: 30,right: 30),
        description: "Enjoy some amazing promotions and get the area news day by day",
        pathImage: "assets/images/promote.jpeg",
         heightImage: 400,
        backgroundColor: Colors.white,
      ),
      Slide(
        title: "Promote your business",
        marginTitle: EdgeInsets.only(top:100,bottom: 0),
        marginDescription: EdgeInsets.only(top:20,left: 30,right: 30),
               styleTitle: TextStyle(color: AppColors.primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.w800
        ),
        styleDescription: TextStyle(color: Colors.black,
        fontSize: 20),
        description: "Take advantage of the CUN app to promote your business and increase your clients",
        pathImage: "assets/images/Discount-bro (1).png",
        heightImage: 400,
        backgroundColor: Colors.white,
      ),
    ];

  @override
  Widget build(BuildContext context) {
     return  IntroSlider(
      slides: this.slides,
      renderDoneBtn: DoneButton(),
      doneButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        //textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black))
         ),
      onDonePress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

      },
      //onDonePress: introcontrol.onDonePress(context),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  
}