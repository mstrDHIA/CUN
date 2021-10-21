import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/screens/promotion/add_promotion.dart';
import 'package:grocery_app/screens/promotion/my_promotions.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/menu_widgets.dart';

import '../promotions_screen.dart';
import 'navigator_item.dart';

class OwnerDashboardScreen extends StatefulWidget {
  final Store store;

  const OwnerDashboardScreen({Key key, this.store}) : super(key: key);
  @override
  _OwnerDashboardScreenState createState() => _OwnerDashboardScreenState(store);
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
    final Store store;

  
  int currentIndex = 1;


  
  _OwnerDashboardScreenState(this.store);
  
  //navitems=navigatorItems;
  @override
  Widget build(BuildContext context) {
   final UserController usercontrol = Get.put(UserController());
  List<NavigatorItem> ownerNavigatorItems = [

  NavigatorItem("Promotions", Icon(Icons.local_offer), 0, MyPromotions()),
    NavigatorItem("Home", Icon(Icons.home), 1, StoreDetailsScreen(usercontrol.store)),

    NavigatorItem("Contact", Icon(Icons.chat), 2, AddPromotionScreen()),

];

    return Scaffold(
      drawer: Drawer(child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: ListView.builder(
                  itemCount: menu_items.length,
                  itemBuilder: (context, index){
                  return MenuItem(index,context);
                })
              ),
      ),

      ),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        //leading: IconButton(icon:Icon(Icons.menu), onPressed:(){} ),
        title: Text("CUN"),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))],),
      body: ownerNavigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: ownerNavigatorItems.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index, iconPath: e.iconPath);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {String label, Icon iconPath, int index}) {
    Color iconColor =
        index == currentIndex ? AppColors.primaryColor : Colors.black;
    return BottomNavigationBarItem(
      label: label,
      icon: iconPath
      // SvgPicture.asset(
      //   iconPath,
      //   color: iconColor,
      // ),
    );
  }
}
