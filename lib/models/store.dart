
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Category.dart';

class Store{
  String id;
  double long;
  double lat;
  String name;
  String address;
  String country;
  String city;
  int zipCode;
  String manager;
  int phone;
  List<dynamic> social;
  String email;
  Category category;
  String image;
  List<dynamic> images;
  Timestamp opentime;
  Timestamp closetime;
  List<dynamic> available;
  String description;

  Store({ List<dynamic> images,Timestamp opentime,Timestamp closetime,List<dynamic> available,String description,String id,String image,Category category,double long,double lat,String name,String address,String country,String city,int zipCode,String manager,int phone,List<dynamic> social,String email}){
    this.long=long;
    this.image=image;
    this.lat=lat;
    this.name=name;
    this.address=address;
    this.country=country;
    this.city=city;
    this.zipCode=zipCode;
    this.category=category;
    this.manager=manager;
    this.phone=phone;
    this.social=social;
    this.email=email;
     this.images=images;
  this.opentime=opentime;
  this.closetime=closetime;
  this.available=available;
  this.description=description;
  this.id=id;

  }

 Map<String,dynamic> toJson() => {
 'long':long,
    'image':image,
    'lat':lat,
    'name':name,
    'address':address,
    'country':country,
    'city':city,
    'zipCode':zipCode,
    'category':category,
    'manager':manager,
    'phone':phone,
    'social':social,
    'email':email,
    'images':images,
  'opentime':opentime,
  'closetime':closetime,
  'available':available,
  'description':description,
  'id':id,
      };


       Store.fromJson(Map<String, dynamic> json)
      : long=json['long'],
    image=json['image'],
    lat=json['lat'],
    name=json['name'],
    address=json['address'],
    country=json['country'],
    city=json['city'],
    zipCode=json['zipCode'],
    category=json['category'],
    manager=json['manager'],
    phone=json['phone'],
    social=json['social'],
    email=json['email'],
     images=json['images'],
  opentime=json['opentime'],
  closetime=json['closetime'],
  available=json['available'],
  description=json['description'],
  id=json['id'];
    
  
}