import 'package:flutter/material.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/screens/feedback/send_feedback.dart';
import 'package:grocery_app/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'input_widgets.dart';

List<String> menu_items=[
  "Settings",
  "About Us",
  "Support",
  "Log Out",
  ];


  Widget MenuItem(int i,context){
          Widget image=Image.asset("assets/images/Bugfixing.gif");

    Color color;
    if(i%2==0){
      color=Colors.white;
    }
    else{
      color=Color(0xfffafafa);
    }
    return ListTile(
      title: Text(menu_items[i]),
      onTap: () async {
        if(i==menu_items.length-2){
          showDialog(
            
            context:context,builder: (BuildContext context) { 
            return AlertDialog(
              actionsPadding: EdgeInsets.all(0),
              buttonPadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(8),
              // insetPadding: EdgeInsets.all(0),
              // titlePadding: EdgeInsets.all(0),
              title: Text("Feedback"),
              actions: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     TextButton(onPressed: () async {  
 var im= AssetImage("assets/images/Bugfixing.gif");
im.evict();
                            },child: Text("Send"),),
                                                  TextButton(onPressed: () { 
                         var im= AssetImage("assets/images/Bugfixing.gif");
im.evict();
                        Navigator.pop(context);
                       },child: Text("Cancel"),),


                   ],
                 ),

              ],
              content: Container(
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                  Column(
                    children: [
                                            // Image.asset("assets/images/Bugfixing.gif"),
                        image,
                      SizedBox(height: 5),
                      Text("Did any thing happen \n we are more than happy to \n hear from you",
                      textAlign: TextAlign.center,),
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                       Container(
                         width:300,
                         child: Input(hint: "title",expands:false,icon: Icon(Icons.text_fields),type: TextInputType.text)),
                    ]
                  )
                ])
              
              ),
            
            );
           }
            
          ).then((value) {
            var im= AssetImage("assets/images/Bugfixing.gif");
im.evict();
          });
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>SendFeedbackScreen()));
        }
        if(i==menu_items.length-1){

          showDialog(context: context, builder: (context){
            return AlertDialog(
              actions: [        TextButton(onPressed: () async {  

                              SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogged", false);
    prefs.remove("user");
    Navigator.push(context, MaterialPageRoute(builder:   (context) => (LoginScreen())),);
                        },child: Text("Yes"),),
                      TextButton(onPressed: () { 
                        Navigator.pop(context);
                       },child: Text("Cancel"),),

],
actionsPadding: EdgeInsets.all(0),
actionsAlignment: MainAxisAlignment.spaceEvenly,
              content: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                  Column(
                    children: [
                      SizedBox(height: 5),
                      Text("Are you sure you want to logout???"),
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                
                    ]
                  )
                ])
              
              ),
            );
          });

    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool("isLogged", false);
    // Navigator.push(context, MaterialPageRoute(builder:   (context) => (LoginScreen())),);

        }
      },
      tileColor: color,

      );
  }