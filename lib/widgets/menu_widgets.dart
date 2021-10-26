import 'package:flutter/material.dart';
import 'package:grocery_app/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> menu_items=[
  "Settings",
  "About Us",
  "Support",
  "Log Out",
  ];


  Widget MenuItem(int i,context){
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
        if(i==menu_items.length-1){

          showDialog(context: context, builder: (context){
            return AlertDialog(
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
                        TextButton(onPressed: () async {  

                              SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogged", false);
    prefs.remove("user");
    Navigator.push(context, MaterialPageRoute(builder:   (context) => (LoginScreen())),);
                        },child: Text("Yes"),),
                      TextButton(onPressed: () { 
                        Navigator.pop(context);
                       },child: Text("Cancel"),),


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