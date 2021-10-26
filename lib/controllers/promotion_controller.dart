import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/promotion/my_promotions.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart';
import 'package:path/path.dart';

import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/models/promotion.dart';
import 'package:grocery_app/models/store.dart';
import 'package:image_picker/image_picker.dart';

import 'home_controller.dart';

class PromotionController extends GetxController {
  Widget currentChoice=SizedBox();
  List<Widget> proms=[SizedBox()];
  List<Widget> onlyproms=[SizedBox()];
  List<Widget> onlyAnn=[SizedBox()];
  List<Promotion> myPro=List();
  Widget imageholder=SizedBox();
  File file;
  String type="Promotion";
  List<Promotion> allPro=List();
  int groupvalue=0;
Widget text2=Text("Announces",
style: TextStyle(
                fontWeight: FontWeight.w600
              ),
);



Widget text1=Padding(padding: EdgeInsets.symmetric(horizontal:30),
              child: Container(child:Text("Promotions",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),)));

 getMyPromotions(UserController usercontrol) async {
   myPro.clear();
  print(myPro.length);
print('aaaaaaaaaa');
  FirebaseApp app = await Firebase.initializeApp();
   // print("Firebase initialized");
  print('aaaaaaaaaa');

    FirebaseFirestore firestore = FirebaseFirestore.instance;
firestore.collection("Announces").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print('aaaaaaaaaa');

        print(result.id);
        //print(result.data());
        //List list = result.data().values.toList();
        DocumentReference dr = result.data().values.last;
        dr.get().then((DocumentSnapshot ds) {
          if(ds.id==usercontrol.store.id){
             Promotion pro = Promotion(
          title: result['title'],
          id: result.id,
          description: result['description'],
          code: result['code'],
          beginDate: result['begin_date'],
          endDate: result['end_date'],
          image: result['image'],
          isPromotion: result['is_promotion']
        );
        myPro.add(pro);
          print(myPro.length);
    update();

          }

          print(ds.id);
        });
       
        //print(result.data().values.last);
      print(result.data());
      });
     
    });
    

    update();
  }


// @override
//   void onInit() { // called immediately after the widget is allocated memory
     
//     super.onInit();
//   }

  getOnlyProms(context){
    allPro.forEach((element) {
      if(element.isPromotion)
      onlyproms.add(PromotionVisitorCard(element,context));
    update();

     });
                     print("ping"+onlyproms.length.toString());

  }
getOnlyAnn(context){
    allPro.forEach((element) {
      if(!element.isPromotion)
      onlyAnn.add(PromotionVisitorCard(element,context));
    update();

     });
  }
 Future<void> getPromotions(HomeController homecontrol) async {
   myPro.clear();
  print(myPro.length);
print('aaaaaaaaaa');
  FirebaseApp app = await Firebase.initializeApp();
   // print("Firebase initialized");
  print('aaaaaaaaaa');

    FirebaseFirestore firestore = FirebaseFirestore.instance;
firestore.collection("Announces").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print('aaaaaaaaaa');

        print(result.id);
        //print(result.data());
        //List list = result.data().values.toList();
        DocumentReference dr = result.data().values.last;
        dr.get().then((DocumentSnapshot ds) {
          int foundindex = homecontrol.stores.indexWhere((element) {
            if(ds.id==element.id){
              return true;
            }
            else{
              return false;
            }
          });

             Promotion pro = Promotion(
          title: result['title'],
          id: result.id,
          description: result['description'],
          code: result['code'],
          beginDate: result['begin_date'],
          endDate: result['end_date'],
          image: result['image'],
          isPromotion: result['is_promotion'],
          store: homecontrol.stores[foundindex]
        );
        allPro.add(pro);
          print(allPro.length);
          currentChoice=PromotionsChoice(this, context);
        //  proms.add(PromotionVisitorCard(pro,context));
    update();

          

          print(ds.id);
        });
       
        //print(result.data().values.last);
      print(result.data());
      });
     
    });
    

    update();
  }



Future getImage() async {
            final ImagePicker _picker = ImagePicker();


                  final XFile image = await _picker.pickImage(source: ImageSource.gallery);
                  if(image!=null){
                     file=File(image.path);
                    imageholder=Column(
                      children: [
                        SizedBox(height:10),
                        Image.file(file,
                        height: 200,
                        ),
                        SizedBox(height:10),

                      ],
                    );
                    update();
                  }
                  print(image.name);
                                      update();

}

Future<String> uploadFile() async {
      final filename=basename(file.path);
      final destination = "/announces/$filename";
      // FirebaseStorage storage = FirebaseStorage.instance;
      // Reference refimage = storage.ref().child("/stores_main/$filename");
      final ref = FirebaseStorage.instance.ref(destination);
      UploadTask uploadtask =ref.putFile(file);
      // TaskSnapshot dowurl = await (await uploadtask.whenComplete(() {}));
      final snapshot= await uploadtask.whenComplete(() {});
      final urlDownload=await snapshot.ref.getDownloadURL();
      //var url = dowurl.toString();
      print(urlDownload);
      return urlDownload;
}

addPro({context,UserController usercontrol,String code,String title,String description,String begin,String end}) async {
 bool isPro=false;
 String url="https://firebasestorage.googleapis.com/v0/b/cun-app.appspot.com/o/defaults%2Fannonce.jpeg?alt=media&token=245f7402-5fcc-410f-b5c5-ac8dc2cc156c";
  if(type=="Promotion"){
    isPro=true;

  }
  if(file!=null){
     url=await uploadFile();
      if(isPro){
        url="https://firebasestorage.googleapis.com/v0/b/cun-app.appspot.com/o/defaults%2Foffre.png?alt=media&token=807a8b86-246a-494f-9933-d2514847ac7d";
      }
  }  
  else{
    
  }
  DocumentReference docref;
  DateTime begindate=DateTime.parse(begin);
  Timestamp beginStamp = Timestamp.fromDate(begindate);
  DateTime enddate=DateTime.parse(end);
  Timestamp endStamp = Timestamp.fromDate(enddate);
  Promotion pro=Promotion(
    beginDate: beginStamp,
    endDate: endStamp,
    code: code ?? "1234",
    description: description,
    title: title,
    image: url,
    store: usercontrol.store,
    isPromotion: isPro
  );
    FirebaseFirestore.instance.collection("Stores")
    .doc(pro.store.id)
    .get()
    .then((DocumentSnapshot data){ 
       CollectionReference announceref = FirebaseFirestore.instance.collection('Announces');
    announceref.add({
      'title':pro.title,
      'description':pro.description,
      'begin_date':pro.beginDate,
      'end_date':pro.endDate,
      'code':pro.code,
      'image':pro.image,
      'is_promotion':pro.isPromotion,
      'store':data.reference
    });
    myPro.add(pro);
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MyPromotions()));
  update();
    }); //this return the DocumentReference }); 

   
}

 }

