import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/promotion.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/screens/home/category_featured_Item_widget.dart';



Widget PromotionCard(Promotion pro,context){
  String available="not available";
  Color color=Colors.red;
  if(pro.beginDate.toDate().isBefore(DateTime.now())){
    available="available";
    color=Colors.green;
  }
  return InkWell(
    onTap: (){
      showDialog(context: context, builder: (context){

        return SimpleDialog(
          backgroundColor: Colors.black,

          children: [
            Image.network(pro.image,
            
            )
          ],
        );
      });
    },
      child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(color: Color(0xfffafafa),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 20,
          color: Colors.black12,
          spreadRadius: 2,
          offset: Offset(2,3)
          )
        ]
        ),
        child: Column(
          children:[
            
            Container(
              
              //height: 200,
              constraints: BoxConstraints(
                maxHeight: 150,
              ),
              // color: Colors.green,
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(pro.image),
            ),
            ),
                    SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(pro.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              Text(available,
              style: TextStyle(
                color: color,
                 fontSize: 14,
                fontWeight: FontWeight.w600
              ),)
            ],),
          ),
                      SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 340
                ),
                child: Text(pro.description,
                   style: TextStyle(
                  color: Colors.black54,
                   fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              
             
            ],),
            
            
          ),
                                SizedBox(height: 10,),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text("From:   ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),),
                                  Text(
                                    pro.beginDate.toDate().year.toString()+
                                    "-"+pro.beginDate.toDate().month.toString()+
                                    "-"+pro.beginDate.toDate().day.toString(),
                                    style: TextStyle(
                      fontSize: 18,
                    ),),

                  ],
                ),
                              Row(
                                children: [
                                  Text("To:   ",
                                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),),
                                  Text(pro.endDate.toDate().year.toString()+
                                  "-"+pro.endDate.toDate().month.toString()+
                                  "-"+pro.endDate.toDate().day.toString(),
                                  style: TextStyle(
                      fontSize: 18,
                    ),
                                  ),

                                ],
                              ),


             
            ],),
            
            
          ),
                                SizedBox(height: 15,),

          
          ]
        ),
      ),
    ),
  );
}


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