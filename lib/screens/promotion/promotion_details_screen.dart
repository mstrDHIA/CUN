import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/promotion_controller.dart';
import 'package:grocery_app/models/promotion.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart';

class PromotionDetailsScreen extends StatelessWidget{
  final Promotion pro;

  const PromotionDetailsScreen({Key key, this.pro}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PromotionController procontrol=Get.put(PromotionController());
    return GetBuilder<PromotionController>(
      builder: (GetxController controller){
        return Scaffold(
          appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("CUN"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xfffafafa),
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>SimpleDialog(
                        children: [
                          Center(
                            child:Image.network(pro.image),
                          )
                        ],
                      ) );
                    },
                    child: getImageHeaderWidget(pro)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)
                              ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, -3),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          Opacity(
                              opacity: 0.5,
                              child: Icon(Icons.horizontal_rule_rounded)),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetailsScreen(pro.store)));
                                      },
                                                                        child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image.network(pro.store.image,)),
                                          SizedBox(width: 10),
                                          AppText(
                                              text: pro.store.name,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ],
                                      ),
                                    ),
                                        Available(pro),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                
                              
                                Text(
                                    pro.description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 24,

                                    ),
                                    ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Begin(pro),
                                End(pro),
                                  ],
                                ),
                                SizedBox(height: 20),
                                  Code(pro),
                                  SizedBox(height: 20),
                                  InkWell(
                                    onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetailsScreen(pro.store)));
                                    },
                                child:StoreAdress(pro),
                                  ),
                                  SizedBox(height: 20),



                       
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                        

          ],
        ),

       
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child:Text("Visit Store"),
            onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetailsScreen(pro.store)));

            },
            ),
          ],
        ),
      ),
        );
      },

    );
    // TODO: implement build
    throw UnimplementedError();
  }

}