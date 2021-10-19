import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class Promotion{
  String id;
  Store store;
  String title;
  String description;
  String code;
  bool active;
  int discount;
  Timestamp beginDate;
  Timestamp endDate;
  String image;
  bool isPromotion;
  Promotion( {bool isPromotion,Store store,String id,String title,String description,String image,String code,bool active,int discount,Timestamp beginDate,Timestamp endDate}){
     this.id=id;
     this.store=store;
  this.title=title;
  this.description=description;
  this.code=code;
  this.active=active;
  this.discount=discount;
  this.beginDate=beginDate;
  this.endDate=endDate;
  this.image=image;
  this.isPromotion=isPromotion;
  }
}


