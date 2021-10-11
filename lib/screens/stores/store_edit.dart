import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/store_controller.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/edit_store_widgets.dart';
import 'package:grocery_app/widgets/item_counter_widget.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:grocery_app/widgets/store_details_widgets.dart';

//import 'favourite_toggle_icon_widget.dart';

class StoreEditScreen extends StatelessWidget {
  final LatLng chosenPosition;
  final int amount = 1;
  final Store store;

   StoreEditScreen({this.store,this.chosenPosition});


  @override
  
  Widget build(BuildContext context) {
          final TextEditingController closecontrol=TextEditingController(text: store.closetime.toDate().hour.toString()+":"+store.closetime.toDate().minute.toString());
          final TextEditingController opencontrol=TextEditingController(text: store.opentime.toDate().hour.toString()+":"+store.opentime.toDate().minute.toString());
          final TextEditingController managercontrol=TextEditingController(text: store.manager);
          final TextEditingController emailcontrol=TextEditingController(text: store.email);
          final TextEditingController phonecontrol=TextEditingController(text: store.phone.toString());

      final TextEditingController desccontrol=TextEditingController(text: store.description);
        final HomeController homecontrol = Get.put(HomeController());
        final StoreController storecontrol = Get.put(StoreController());
    List<TextEditingController> socialcontrol=List();
    for(var s in store.social){
      List<String> socialval=s.split(":");
      TextEditingController socialTempControl=TextEditingController(text:socialval[1]);
      socialcontrol.add(socialTempControl);
    }
    storecontrol.debutEdit();
    
    return GetBuilder<StoreController>(
      
          builder: (GetxController controller) { 

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
        
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    getImageHeaderWidget(controller),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: "Information:",
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: "Description:",
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InputEdit(desccontrol,store,5),
                                SizedBox(
                                  height: 20,
                                ),
                                Type(store,controller,homecontrol),
                                SizedBox(
                                  height: 20,
                                ),
                                Address(store,context),
                                SizedBox(
                                  height: 20,
                                ),
                                OpenDays(store,controller),
                                SizedBox(
                                  height: 20,
                                ),
                                OpenTime(store,controller,context,closecontrol,opencontrol),
                                SizedBox(
                                  height: 20,
                                ),
                               
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: "Contact:",
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ],
                                ),
SizedBox(
                                  height: 20,
                                ),
                                Manager(store,managercontrol),
                                SizedBox(
                                  height: 20,
                                ),
                                Email(store,emailcontrol),
                                SizedBox(
                                  height: 20,
                                ),
                                    Phone(store,phonecontrol),
                                Socials(store,socialcontrol),
                               
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                         

          //   child: Expanded(
          //             child: SingleChildScrollView(

          //               child: Column(

          //           children: [
          //             getImageHeaderWidget(),
          //             Expanded(
          //               child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //       child: Column(
          //         children: [
          //           ListTile(
          //             contentPadding: EdgeInsets.zero,
          //             title: Text(
          //               groceryItem.name,
          //               style: TextStyle(
          //                   fontSize: 24, fontWeight: FontWeight.bold),
          //             ),
          //             subtitle: AppText(
          //               text: groceryItem.description,
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               color: Color(0xff7C7C7C),
          //             ),
          //             trailing: FavoriteToggleIcon(),
          //           ),
          //           Spacer(),

          //           Text("blabalblabalblablabalbalbalbalbalablablablabalblablabalbalbalal"),
          //           Spacer(),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget("Product Details"),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget("Nutritions",
          //               customWidget: nutritionWidget()),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget(
          //             "Review",
          //             customWidget: ratingWidget(),
          //           ),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget(
          //             "Review",
          //             customWidget: ratingWidget(),
          //           ),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget(
          //             "Review",
          //             customWidget: ratingWidget(),
          //           ),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget(
          //             "Review",
          //             customWidget: ratingWidget(),
          //           ),
          //           Divider(thickness: 1),
          //           getProductDataRowWidget(
          //             "Review",
          //             customWidget: ratingWidget(),
          //           ),
          //           Spacer(),
          //           AppButton(
          //             label: "Add To Basket",
          //           ),
          //           Spacer(),
          //         ],
          //       ),
          //               ),
          //             ),
          //           ],
          //         ),
          //     ),
          //   ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Send Message")),
                ElevatedButton(onPressed: () {}, child: Text("Show Location"))
              ],
            ),
          ),
        ),
      );
           },
          
    );
  }

  Widget getImageHeaderWidget(StoreController control) {
    if(control.im==null){
          control.im=Image.network(store.image);

    }
    //var storeimage=NetworkImage(store.image);
    // Widget storeimage= 
    //           Container(
    //             height: 150,
    //             child: Image(
    //       image: NetworkImage(store.image,
          
    //       ),
    //     ),
              
    return Container(
      height: 380,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
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
      child: Column(
              children:[ 
control.im,
                //
        //         Container(
        //         height: 150,
        //         child: Image(
        //   image: NetworkImage(store.image,
          
        //   ),
        // ),
        //       ),
        SizedBox(height: 20),
        FloatingActionButton(onPressed: () async {
          control.changeImage();
          // storeimage.printInfo();
          //     final ImagePicker _picker = ImagePicker();

          //     final XFile image = await _picker.pickImage(source: ImageSource.gallery);
          //     File im=File(image.path);
          //     storeimage=Image.file(im);
        //       storeimage=Container(
        //         height: 150,
        //         child: Image(
        //   image: FileImage(im,
          
        //   ),
        // ),
        //       );
          //    print(storeimage);
           //   storecontrol.update();

              
        },
        child:Icon(Icons.camera)
        )
              ]
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget customWidget}) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          Spacer(),
          if (customWidget != null) ...[
            customWidget,
            SizedBox(
              width: 20,
            )
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: AppText(
        text: "100gm",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  // double getTotalPrice() {
  //   return amount * store.price;
  // }
}
