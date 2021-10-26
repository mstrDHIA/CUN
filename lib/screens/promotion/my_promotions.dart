import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/promotion_controller.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/promotion/add_promotion.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart';

class MyPromotions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
            final PromotionController procontrol = Get.put(PromotionController());
            final UserController usercontrol = Get.put(UserController());

     procontrol.getMyPromotions(usercontrol);
return GetBuilder<PromotionController>(builder: (GetxController controller){
  return Scaffold(
    
    body: Stack(
          children:[ ListView.builder(
        itemCount: procontrol.myPro.length,
        itemBuilder: (BuildContext context,int index){
        return Center(child: PromotionCard(procontrol.myPro[index],context));
      }),
      Positioned(
        bottom: 25,
        right:20,
        child:
      FloatingActionButton(onPressed: (){
        Navigator.push(context, (MaterialPageRoute(builder: (context){
          return AddPromotionScreen();
        })));
      },
      child: Icon(Icons.add),
      
      )
       ,)
          ]
    ),
  );
});


    // TODO: implement build
    throw UnimplementedError();
  }

}