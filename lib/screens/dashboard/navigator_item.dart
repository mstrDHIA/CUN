import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/account/account_screen.dart';
import 'package:grocery_app/screens/chat/chat_screen.dart';
import 'package:grocery_app/screens/map/map_screen.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/screens/stores/explore_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/screens/promotion/add_promotion.dart';

import '../promotion/promotions_screen.dart';
import '../test_screen.dart';

class NavigatorItem {
  final String label;
  final Icon iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}


UserController usercontrol=UserController();



