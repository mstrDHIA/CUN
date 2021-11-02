import 'package:cloud_firestore/cloud_firestore.dart';
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


  Widget MenuItem(int i,ctx){
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
            
            context:ctx,builder: (BuildContext context) { 
              TextEditingController titlecontrol=TextEditingController();
              TextEditingController msgcontrol=TextEditingController();
            return GestureDetector(
                    onTap:(){Navigator.pop(context);},

                          child: Scaffold(
backgroundColor: Colors.transparent,
                            body: Builder(
                              builder: (context)=>GestureDetector(
                                child: AlertDialog(
                      actionsPadding: EdgeInsets.only(top:16),
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
                               FirebaseFirestore firestore=FirebaseFirestore.instance;
                               
                               if(titlecontrol.text==""||msgcontrol.text==""){
                                 final snackBar = SnackBar(content: Text('Please fill the required fields'),
                                 duration: Duration(seconds:5),);


ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               }
                               else{
                               firestore.collection("Feedback").add({
                                 'title':titlecontrol.text,
                                 'message':msgcontrol.text,
                               });
 var im= AssetImage("assets/images/Bugfixing.gif");
im.evict();
 final snackBar = SnackBar(content: Text('Feedback sent'),
                        duration: Duration(seconds:5),);

                                ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
                                Navigator.pop(context);
                       
                               }
                                    },child: Text("Send"),),
                                                          TextButton(onPressed: () { 
                                 var im= AssetImage("assets/images/Bugfixing.gif");
im.evict();
                                Navigator.pop(context);
                               },child: Text("Cancel"),),


                           ],
                         ),

                      ],
                      content: SingleChildScrollView(
                                      child: Container(
                          height: 550,
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
                                   child: Input(control: titlecontrol,hint: "title",expands:false,icon: Icon(Icons.text_fields),type: TextInputType.text)),
                                  
                              ]
                            ),
                          Padding(  padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Text (
                      "Message",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                     Container(
                                   width:300,
                                   child: Input(control:msgcontrol,hint: "",expands:false,icon: Icon(Icons.text_fields),type: TextInputType.text)),
          ],
        ),
      ),
                               
                          ])
                        
                        ),
                      ),
                    
                    ),
                  ),
                ),
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

          showDialog(context: ctx, builder: (context){
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