import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/widgets/login_widgets.dart';

class VisitorLoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
            final UserController usercontrol = Get.put(UserController());

    return SafeArea(
          child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    FloatingActionButton(
                      backgroundColor: Color(0xfffafafa),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Icon(Icons.arrow_back_ios,
                    color: Colors.black,),
                      ),
                    onPressed: (){
                      Navigator.pop(context);
                    }),
                  ]
              ),
                ),
                              Image.asset("assets/images/cun_logo.png",
                              height: 170,),

                VisitorLoginCard(usercontrol,context),
              ],
            ),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}