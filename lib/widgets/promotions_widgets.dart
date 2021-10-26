import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/promotion_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/promotion.dart';
import 'package:grocery_app/screens/promotion/promotion_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/screens/home/category_featured_Item_widget.dart';


Widget DropTypes(PromotionController control){
 //storecontrol.dropval=store.category.name;
List<String> types=["Promotion","Announce"];

return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text (
          "Type",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        width: 162,
      ),
      Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
        
          child:   DropdownButton<String>(
value: control.type,
icon: const Icon(Icons.arrow_downward),
iconSize: 24,
elevation: 16,
style: const TextStyle(
  color: Colors.deepPurple
),
underline: Container(
  height: 2,
  color: Colors.deepPurpleAccent,
),
onChanged: (String newValue) {
  control.type=newValue;
    control.update();
  //  dropval = newValue;
       //     storecontrol.update();
},
items: types
  .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  })
  .toList(),
      )
                          
            )),
      
    ],
  );
}



Widget ImageInput(Icon icon,PromotionController control){
          return FloatingActionButton(
            child: icon,
            onPressed: ()  { 
            control.getImage();
           },);

}


Widget Available(Promotion pro){
String available="not available";
  Color color=Colors.red;
  if(pro.beginDate.toDate().isBefore(DateTime.now())){
    available="available";
    color=Colors.green;
  }
return Text(available,
                  style: TextStyle(
                    color: color,
                     fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),);
}


Begin(Promotion pro){

  return Text("From "+pro.beginDate.toDate().year.toString()+
  "-"+pro.beginDate.toDate().month.toString()+
  "-"+pro.beginDate.toDate().day.toString(),
  style: TextStyle(
    fontSize: 20
  ),
  
  );
}
End(Promotion pro){

  return Text("To "+pro.endDate.toDate().year.toString()+
  "-"+pro.endDate.toDate().month.toString()+
  "-"+pro.endDate.toDate().day.toString(),
  style: TextStyle(
    fontSize: 20
  ),
  
  );
}
Widget PromotionCard(Promotion pro,context){
  String available="not available";
  Color color=Colors.red;
  if(pro.beginDate.toDate().isBefore(DateTime.now())){
    available="available";
    color=Colors.green;
  }
  return Column(
    children: [
      SizedBox(height:20),
      InkWell(
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
      ),
    ],
  );
}



Widget StoreAdress(Promotion pro){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Store",
    style: TextStyle(
      fontSize: 20
    ),),
    Text(pro.store.name,
    style: TextStyle(
      fontSize: 20,
      color: Colors.blueAccent
    ),)

  ],);
}



Code(Promotion pro){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Code",
    style: TextStyle(
      fontSize: 20
    ),),
    Text(pro.code,
    style: TextStyle(
      fontSize: 20
    ),)

  ],);
}

Widget AnnouncesChoice(PromotionController procontrol,context){
 print("announcess");
  print("promotions "+procontrol.allPro.length.toString());
  
  procontrol.proms.clear();
                                  procontrol.onlyproms.clear();
                                  List<Promotion>onlyanns=[];
                                  List<Widget> annWidget=[];
                                                                    int j=0;

                                  for(int i=0;i<procontrol.allPro.length;i++){
                                      if(!procontrol.allPro[i].isPromotion){
                                        onlyanns.add(procontrol.allPro[i]);
                                        
                                        annWidget.add(PromotionVisitorCard(onlyanns[j],context));
                                        j++;
                                      }
                                  }
                                  
                // procontrol.getOnlyProms(context);
                //  for(int i=0;i<procontrol.onlyproms.length;i++){
                //    procontrol.proms.add(procontrol.onlyproms[i]);
                //  }
                                // procontrol.update();
                                // print(procontrol.proms.length);
                                // print("this is"+procontrol.onlyproms.length.toString());

               procontrol.update();
               return Column(children:[
                 for(var i in annWidget)
               i]);
}

Widget PromotionsChoice(PromotionController procontrol,context){
  print("promotions "+procontrol.allPro.length.toString());
  
  procontrol.proms.clear();
                                  procontrol.onlyproms.clear();
                                  List<Promotion>onlyproms=[];
                                  List<Widget> promsWidget=[];
                                  int j=0;
                                  for(int i=0;i<procontrol.allPro.length;i++){
                                      if(procontrol.allPro[i].isPromotion){
                                        onlyproms.add(procontrol.allPro[i]);
                                        promsWidget.add(PromotionVisitorCard(onlyproms[j],context));
                                      j++;
                                      }
                                  }
                                  
                // procontrol.getOnlyProms(context);
                //  for(int i=0;i<procontrol.onlyproms.length;i++){
                //    procontrol.proms.add(procontrol.onlyproms[i]);
                //  }
                                // procontrol.update();
                                // print(procontrol.proms.length);
                                // print("this is"+procontrol.onlyproms.length.toString());

               procontrol.update();
               return Column(children:[
                 for(var i in promsWidget)
               i]);
}

Widget getImageHeaderWidget(Promotion pro) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(pro.image)
           
          ),
        color: Colors.blue,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(25),
        //   bottomRight: Radius.circular(25),
        // ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      // child: Image(
      //   image: NetworkImage(store.image,
        
      //   ),
      // ),
      
    );
  }


Widget PromotionVisitorCard(Promotion pro,context){
  String available="not available";
  Color color=Colors.red;
  if(pro.beginDate.toDate().isBefore(DateTime.now())){
    available="available";
    color=Colors.green;
  }
  return Column(
    children: [
      SizedBox(height:20),
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PromotionDetailsScreen(pro: pro)));
          },
                  child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:16.0,
                right:16,
                left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      
                      children: [
                        CircleAvatar(
                          child: Image.network(pro.store.image),
                        ),
                        SizedBox(width: 10,),
                        Text(pro.store.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ],
                    ),
                    Text(available,
                      style: TextStyle(
                        color: color,
                         fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),),
                  ],
                ),
              ),
              Column(
                children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(pro.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),),
                
              ],),
            ),
                        SizedBox(height: 10,),

                                  SizedBox(height: 15,),

            ],
              ),
            ]
          ),
        ),
      ),
        ),

    ],
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