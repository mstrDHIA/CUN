import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/account/account_screen.dart';
import 'package:grocery_app/screens/chat/chat_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/screens/map/map_screen.dart';
import 'package:grocery_app/screens/promotion/promotions_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/menu_widgets.dart';

// import '../promotions_screen.dart';
import 'navigator_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  int currentIndex = 2;
  
  //navitems=navigatorItems;
  @override
  Widget build(BuildContext context) {
UserController usercontrol=Get.put(UserController());
  usercontrol.getUserFromPrefs();
List<NavigatorItem> navigatorItems = [
    NavigatorItem("Account", Icon(Icons.account_circle), 0, AccountScreen(user:usercontrol.loggeduser)),

  NavigatorItem("Map", Icon(Icons.location_on), 1, MapScreen()),
  NavigatorItem("Home", Icon(Icons.home), 2, HomeScreen()),
  NavigatorItem("Promotions", Icon(Icons.local_offer), 3, PromotionsScreen()),
    NavigatorItem("Contact", Icon(Icons.chat), 4, ChatScreen()),

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
      body: navigatorItems[currentIndex].screen,
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
            items: navigatorItems.map((e) {
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
