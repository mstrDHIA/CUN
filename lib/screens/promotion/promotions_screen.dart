import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/promotion_controller.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/promotion/add_promotion.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart';

class PromotionsScreen extends StatelessWidget{
  bool ok=true;
  
  @override
  Widget build(BuildContext context) {
            final PromotionController procontrol = Get.put(PromotionController());
            final HomeController homecontrol = Get.put(HomeController());
      procontrol.allPro.clear();
      procontrol.proms.clear();

                    procontrol.onlyproms.clear();
                               procontrol.getPromotions(homecontrol);

                procontrol.getOnlyProms(context);
                print("ping"+procontrol.onlyproms.length.toString());
                 for(int i=0;i<procontrol.onlyproms.length;i++){
                   procontrol.proms.add(procontrol.onlyproms[i]);
                                    procontrol.update();

                 }
                                                  //   procontrol.update();

return GetBuilder<PromotionController>(builder: (GetxController controller){
  
  
  return Scaffold(
    
    body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(
            child: CupertinoSlidingSegmentedControl(
            //  backgroundColor: AppColors.primaryColor,
    thumbColor: AppColors.primaryColor,
              groupValue: procontrol.groupvalue,
              children: {
              0:procontrol.text1,
              1:procontrol.text2
            }, onValueChanged: (value){
              if(value==0){
                                  procontrol.proms.clear();
                                  procontrol.onlyproms.clear();
                procontrol.getOnlyProms(context);
                 for(int i=0;i<procontrol.onlyproms.length;i++){
                   procontrol.proms.add(procontrol.onlyproms[i]);
                 }
                                procontrol.update();
                                print(procontrol.proms.length);
                                print("this is"+procontrol.onlyproms.length.toString());

                procontrol.text1=Padding(padding: EdgeInsets.symmetric(horizontal:30),
              child: Container(child:Text("Promotions",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),)));
              procontrol.text2=Padding(padding: EdgeInsets.symmetric(horizontal:30),
              child: Container(child:Text("Announces",
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),)));
              }
              else{
                                procontrol.getOnlyAnn(context);
                  procontrol.proms.clear();
                  procontrol.onlyAnn.clear();
                  for(int i=0;i<procontrol.onlyAnn.length;i++){
                    procontrol.proms.add(procontrol.onlyAnn[i]);
                  }
                  procontrol.proms=procontrol.onlyAnn;
                                procontrol.update();
                                print("this is"+procontrol.onlyAnn.length.toString());

                  procontrol.text1=Padding(padding: EdgeInsets.symmetric(horizontal:30),
              child: Container(child:Text("Promotions",
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),)));
              procontrol.text2=Padding(padding: EdgeInsets.symmetric(horizontal:30),
              child: Container(child:Text("Announces",
              style: TextStyle(
                color: Colors.white,

                fontWeight: FontWeight.w600
              ),)));
              }
              procontrol.groupvalue=value;
              procontrol.update();
              print(value);
            }),
          ),
          for(var pro in procontrol.proms)
          pro,
          // ListView.builder(
          //     itemCount: procontrol.allPro.length,
          //     itemBuilder: (BuildContext context,int index){
          //     return Center(child: PromotionCard(procontrol.allPro[index],context));
          //   }),
        ],
      ),
    ),
  );
});


    // TODO: implement build
    throw UnimplementedError();
  }

}