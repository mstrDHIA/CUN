import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/screens/dashboard/owner_dashboard_screen.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/screens/stores/store_edit.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/models/store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class StoreController extends GetxController{
Timestamp opentime;
Timestamp closetime;
DateTime datetimeopen;
DateTime datetimeclose;
List<String> services;
Image im;
File file;
String dropval;
List<String> days=List();
List colors=List();
Store store;
String address;
LatLng pos;
bool loading=false;

Future<String> uploadFile() async {
      final filename=basename(file.path);
      final destination = "/stores_main/$filename";
      // FirebaseStorage storage = FirebaseStorage.instance;
      // Reference refimage = storage.ref().child("/stores_main/$filename");
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      UploadTask uploadtask =ref.putFile(file);
      // TaskSnapshot dowurl = await (await uploadtask.whenComplete(() {}));
      final snapshot= await uploadtask.whenComplete(() {});
      final urlDownload=await snapshot.ref.getDownloadURL();
      //var url = dowurl.toString();
      print(urlDownload);
      return urlDownload;
}




Future<void> updateStore({List<TextEditingController> social,TextEditingController opencontrol,TextEditingController closecontrol,HomeController homecontrol,String description,String manager,String email,String phone,context}) async {
  List<String> socialnames=List();
        loading=true;

          update();

  int number=int.parse(phone);
  for(int i=0;i<store.social.length;i++){
    List<String> s=store.social[i].split(":");
    socialnames.add(s[0]+":"+social[i].text);
  }
final found =
      homecontrol.categories.firstWhere((element) =>
          element.name == dropval,
          orElse: () {
            return null;
  });   
  colors.forEach((element) {
    if(element[1]){
      days.add(element[0]);
    }
   }); 

if(closetime==null){
closetime = store.closetime; 
}
else{
 // print("controller time "+opencontrol.text);
 // DateTime open=DateTime.parse(opencontrol.text);
   closetime=Timestamp.fromDate(datetimeclose);

}
if(opentime==null){
opentime = store.opentime; 
}
else{
 // print("controller time "+opencontrol.text);
 // DateTime open=DateTime.parse(opencontrol.text);
   opentime=Timestamp.fromDate(datetimeopen);

}
//To TimeStamp
// Timestamp open = Timestamp.fromDate(opentime); //To TimeStamp
print("my name is "+manager);
  Store newstore=Store(
    id:store.id,
    description:description,
    manager:manager,
    phone: number,
    email: email,
    available: days,
    address: address,
    lat: pos.latitude,
    long: pos.longitude,
    category: found,
    country: "Tunisia",
    zipCode: store.zipCode,
    closetime: closetime,
    opentime: opentime,
    city: store.city,
    name: store.name,
    social: socialnames,
  );
    print(newstore.available);

  //newstore=store;
  String image=store.image;
  if(file!=null){
      print("upload start");
      
       image=await uploadFile();
  }
  print(manager);
print(newstore.manager);
  print(store.id);


FirebaseFirestore.instance.collection("Categories")
    .doc(found.id)
    .get()
    .then((DocumentSnapshot data){ 
      CollectionReference storeref = FirebaseFirestore.instance.collection('Stores');
  storeref
    .doc(store.id)
    .update({
    'description':description,
    'manager':manager,
    'phone': int.parse(phone),
    'email': email,
    'open_days': days,
    'address': address,
    'lat': newstore.lat,
    'long': newstore.long,
    'category': data.reference,
    'country': "Tunisia",
    'zip_code': newstore.zipCode,
    'close_time': closetime,
    'open_time': opentime,
    'city': store.city,
    'name': store.name,
    'Social': newstore.social,
    'image':image
    })
    .then((value) {
      Category cat=Category(
        name: data['name'],
        image: data['image'],
        id: data.id
      );
      store.description=description;
    store.manager=manager;
    store.phone= int.parse(phone);
    store.email= email;
    store.address= address;
    store.category=cat;
    store.available=days;
    store.image=image;
    
    store.closetime= closetime;
    store.opentime= opentime;
    print("open time is "+opentime.toDate().hour.toString());
    // colors.clear();
    store.social= newstore.social;
      print("User Updated");
      closetime=null;
      opentime=null;
            loading=true;
        update();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OwnerDashboardScreen(store:store)));
      update();
    } )
    .catchError((error) => print("Failed to update user: $error"));

    });

  

    // newstore.category.name=dropval;
  
  
  // firebase_storage.FirebaseStorage storage =
  // firebase_storage.FirebaseStorage.instance;
  // Directory tempDir = await getApplicationDocumentsDirectory();
  // String filePath = '${tempDir.absolute}/file-to-upload.png';

  // // String filePath = '${appDocDir.absolute}/${store.name}.png';
  // // try {
  //   await firebase_storage.FirebaseStorage.instance
  //       .ref('uploads/${store.name}')
  //       .putFile(File(tempPath));
  // } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
  // }
}


void changeAddress(String chosenAddress, LatLng chosenpos){
  address=chosenAddress;
  pos=chosenpos;
  update();
}


Future<void> selectCloseTime(BuildContext context,TimeOfDay selectedTime,TextEditingController closecontrol) async {
final TimeOfDay picked_s = await showTimePicker(
    context: context,
    initialTime: selectedTime, builder: (BuildContext context, Widget child) {
       return MediaQuery(
         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});
if (picked_s != null && picked_s != selectedTime ){
final now = new DateTime.now();
    selectedTime = picked_s;
    
    DateTime closetimedate = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    datetimeclose=closetimedate;

    closetime=Timestamp.fromDate(closetimedate);
    closecontrol.text=selectedTime.hour.toString()+":"+selectedTime.minute.toString();
    update();
}

  
}


Future<void> selectOpenTime(BuildContext context,TimeOfDay selectedTime,TextEditingController closecontrol) async {
final TimeOfDay picked_s = await showTimePicker(
    context: context,
    initialTime: selectedTime, builder: (BuildContext context, Widget child) {
       return MediaQuery(
         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});
if (picked_s != null && picked_s != selectedTime ){
final now = new DateTime.now();
    selectedTime = picked_s;
     DateTime opentimedate = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
         datetimeopen=opentimedate;
    opentime=Timestamp.fromDate(opentimedate);
    closecontrol.text=selectedTime.hour.toString()+":"+selectedTime.minute.toString();
    update();
}

  
}

 

changeCategory(String newval){
  dropval=newval;
  print(dropval);
  update();
}

 changeImage() async {
              final ImagePicker _picker = ImagePicker();

              final XFile pickedimage = await _picker.pickImage(source: ImageSource.gallery);
               file=File(pickedimage.path);
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
