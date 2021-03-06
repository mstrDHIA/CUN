import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/screens/stores/explore_screen.dart';
import 'package:grocery_app/styles/colors.dart';


//var categoriees=[["Food",Colors.red.withOpacity(0.25),"assets/images/rise.png"],["Health",Colors.green.withOpacity(0.25),"assets/images/categories_images/stethoscope (2).png"],["Sport",Colors.blue.withOpacity(0.25),"assets/images/categories_images/sports.png"]];


        List<dynamic> categories=List();

//  List<Category> categories=[
//    Category("Food",Colors.red.withOpacity(0.25),"assets/images/rise.png"),
//    Category("Health",Colors.green,"assets/images/categories_images/stethoscope (2).png"),
//    Category("Sport",Colors.blue,"assets/images/categories_images/sports.png"),

//    ];



class CategoryFeaturedCard extends StatelessWidget {
    

  @override
  Widget build(BuildContext context) {
    final HomeController homecontrol = Get.put(HomeController());
        List<Category> c = homecontrol.categories;
        //if(c.isNotEmpty){
          //c.clear();
          // print(homecontrol.categories.length);
          // print(c.length);
          if(categories.isNotEmpty){
            categories.clear();
          }
       // }
        for(int i=0;i<c.length;i++){
          Color color=Colors.primaries[Random().nextInt(Colors.primaries.length)];
          categories.add([c[i].name,color.withOpacity(0.25),c[i].image]);
        }
        
    return new Container(
  height: 100.0,

  child: new ListView.builder(
    
        itemCount: categories.length,
        

    itemBuilder: (context, index){
    return CategoryItem(index,homecontrol,context);
  } ,scrollDirection: Axis.horizontal,
  
  ),
);
  }

}


Widget CategoryItem(int i,HomeController control,context){
  
  return FlatButton(onPressed: (){
   List<Store> foundStores= control.getStoresByCategory(categories[i][0]);
  Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => ExploreScreen(foundStores: foundStores,keyword: foundStores[0].category.name,)),
    );
           },
          child: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.symmetric(vertical: 16, ),
        decoration: BoxDecoration(
            color: categories[i][1],
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            Image(
              image: NetworkImage(categories[i][2],
              scale:2),
            ),
            SizedBox(
              height: 5,
            ),
            AppText(
              text: categories[i][0],
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
  );
  }

