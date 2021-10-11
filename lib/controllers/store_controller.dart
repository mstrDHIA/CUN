import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/store.dart';
import 'package:image_picker/image_picker.dart';

class StoreController extends GetxController{

Image im;
String dropval="Food";
List<String> days=List();
List colors=List();
Store store;


Future<void> selectTime(BuildContext context,TimeOfDay selectedTime,TextEditingController closecontrol) async {
final TimeOfDay picked_s = await showTimePicker(
    context: context,
    initialTime: selectedTime, builder: (BuildContext context, Widget child) {
       return MediaQuery(
         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

if (picked_s != null && picked_s != selectedTime )
  
    selectedTime = picked_s;
    closecontrol.text=selectedTime.hour.toString()+":"+selectedTime.minute.toString();
    update();
  
}

 

changeCategory(String newval){
  dropval=newval;
  print(dropval);
  update();
}

 changeImage() async {
              final ImagePicker _picker = ImagePicker();

              final XFile pickedimage = await _picker.pickImage(source: ImageSource.gallery);
              File file=File(pickedimage.path);
              im=Image.file(file);
              print("this");
              print(im);
              update();
        //       storeimage=Container(
        //         height: 150,
        //         child: Image(
        //   image: FileImage(im,
          
        //   ),
        // ),
        //       );
              //print(storeimage);
  }


  @override
  void onInit() { // called immediately after the widget is allocated memory
 
    super.onInit();
  }


  debutEdit(){
    bool ok=false;
  colors=[["M",ok],["T",ok],["W",ok],["Th",ok],["F",ok],["Sa",ok],["S",ok],];
  print(store.available.length);
  for(int i=0;i<store.available.length;i++){

      int index=colors.indexWhere((element) =>
          element[0] == store.available[i],
        );
  if(index>=0){
    colors[index][1]=true;
  }
       }
  }
  changeDay(open,index){
        print(colors[index][1]);

    if(open){
      colors[index][1]=false;
    }
    else{
      colors[index][1]=true;

    }
    print(colors[index][1]);
          update();

  }

 }
