import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/screens/home/category_featured_Item_widget.dart';



// List<Category> categories=[
//    Category("Food","assets/images/rise.png"),
//    Category("Health","assets/images/categories_images/stethoscope (2).png"),
//    Category("Sport","assets/images/categories_images/sports.png"),
//      Category("Food","assets/images/rise.png"),
//    Category("Health","assets/images/categories_images/stethoscope (2).png"),
//    Category("Sport","assets/images/categories_images/sports.png"),
//      Category("Food","assets/images/rise.png"),
//    Category("Health","assets/images/categories_images/stethoscope (2).png"),
//    Category("Sport","assets/images/categories_images/sports.png"),
//    Category("Sport","assets/images/categories_images/sports.png"),

//    ];


Widget CategoryItems(){
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top:16.0,left:12),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            
                      crossAxisCount: 5,  
                      mainAxisExtent: 110,
                      crossAxisSpacing: 1.0,  
                      mainAxisSpacing: 1.0  
                  ),  
                  itemCount: categories.length,

                  
                  itemBuilder: (BuildContext context, int index){
                    
                    return CategoryItem(index);
                   }),
    ),
  );
}

Widget CategoryItem(int i){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 5,
              color: AppColors.primaryColor
            )
          ),
          width: 70,
          height: 70,
          child:RaisedButton(child: Image.asset(categories[i].image),onPressed: (){},color: Colors.white,)
        ),
        Text(categories[i].name),
      ],
    ),
  );
}