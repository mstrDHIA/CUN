import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/promotion_controller.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/input_widgets.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart' as prowidget;
import 'package:grocery_app/widgets/promotions_widgets.dart';

import 'package:image_picker/image_picker.dart';

class AddPromotionScreen extends StatelessWidget{
    TextEditingController codecontrol=TextEditingController();

  TextEditingController titlecontrol=TextEditingController();
    TextEditingController desccontrol=TextEditingController();
  TextEditingController begincontrol=TextEditingController();
  TextEditingController endcontrol=TextEditingController();

  @override
  Widget build(BuildContext context) {
                final PromotionController procontrol = Get.put(PromotionController());
      final UserController usercontrol = Get.put(UserController());
 
    procontrol.imageholder=SizedBox();
    procontrol.file=null;
    return GetBuilder<PromotionController>(
          builder:(GetxController controller){ 
            return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          //leading: IconButton(icon:Icon(Icons.menu), onPressed:(){} ),
          title: Text("CUN"),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))],),
      
          body:SingleChildScrollView(
                      child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 800
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(2,3)
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: 
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                   Input(control: codecontrol,hint: "code           ",icon: Icon(Icons.code), type: TextInputType.number,expands: false,),
                   SizedBox(height: 10,),

                   Input(control: titlecontrol,hint: "title             ",icon: Icon(Icons.title), type: TextInputType.text,expands: false,),
                   SizedBox(height: 20,),
                   Input(control: desccontrol,hint: "description",icon: Icon(Icons.title), type: TextInputType.text,expands: false),
                                SizedBox(height: 20,),

                   DateInput(control: begincontrol,hint: "begin date",icon: Icon(Icons.date_range),context: context),
                                SizedBox(height: 20,),

                   DateInput(control: endcontrol,hint: "end date   ",icon: Icon(Icons.date_range),context: context ),
                                SizedBox(height: 20,),
                                DropTypes(procontrol),
                               // SizedBox(height: 20,),

                                procontrol.imageholder,
                                  SizedBox(height: 10,),

                   prowidget.ImageInput(Icon(Icons.camera),controller),
                   SizedBox(height:20)
                  ],),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: ElevatedButton(child: Text("Confirm"),
                      onPressed: (){
                        procontrol.addPro(
                          context:context,
                          begin: begincontrol.text,
                          end:endcontrol.text,
                          title: titlecontrol.text,
                          description: desccontrol.text,
                          code: codecontrol.text,
                          usercontrol: usercontrol
                        );
                      },
                  ),
                ),
              ],
            )
          ),
        );
          });
    // TODO: implement build
    throw UnimplementedError();
  }

}