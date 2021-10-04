import 'package:flutter/material.dart';

List<String> menu_items=[
  "Settings",
  "About Us",
  "Support",
  "Log Out",
  ];


  Widget MenuItem(int i){
    Color color;
    if(i%2==0){
      color=Colors.white;
    }
    else{
      color=Color(0xfffafafa);
    }
    return ListTile(
      title: Text(menu_items[i]),
      onTap: (){},
      tileColor: color,

      );
  }