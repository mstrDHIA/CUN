import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/widgets/login_widgets.dart';

class BusinessOwnerLoginScreen extends StatelessWidget{
  TextEditingController emailcontrol=TextEditingController();
    TextEditingController psdcontrol=TextEditingController();

  @override
  Widget build(BuildContext context) {
                final UserController usercontrol = Get.put(UserController());

    return SafeArea(
          child: Scaffold(
        body: Column(
          
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
                SizedBox(height:100),
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Center(child: BusinessOwnerLoginCard(usercontrol,context,emailcontrol,psdcontrol)),
              ],
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}