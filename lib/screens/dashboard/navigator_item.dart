import 'package:flutter/material.dart';
import 'package:grocery_app/screens/account/account_screen.dart';
import 'package:grocery_app/screens/map/map_screen.dart';
import 'package:grocery_app/screens/stores/explore_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/screens/promotion/add_promotion.dart';

import '../promotions_screen.dart';

class NavigatorItem {
  final String label;
  final Icon iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
    NavigatorItem("Account", Icon(Icons.account_circle), 0, AccountScreen()),

  NavigatorItem("Map", Icon(Icons.location_on), 1, MapScreen()),
  NavigatorItem("Home", Icon(Icons.home), 2, HomeScreen()),
  NavigatorItem("Promotions", Icon(Icons.local_offer), 3, PromotionsScreen()),
    NavigatorItem("Contact", Icon(Icons.chat), 4, AddPromotionScreen()),

];
