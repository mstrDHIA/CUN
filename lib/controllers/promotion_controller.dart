import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/models/promotion.dart';
import 'package:grocery_app/models/store.dart';

class PromotionController extends GetxController {
  List<Promotion> myPro=List();

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


 }

