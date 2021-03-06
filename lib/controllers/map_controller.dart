import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/store_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/widgets/map_widgets.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
class MapController extends GetxController {
final Completer<GoogleMapController> gcontrol = Completer();
final Set<Marker> markers=Set();
List<Widget> card=[Container()]; 
final List<Widget> filterCard=[Container()]; 
 bool filterVisible=false;



// void filter(){
//   Set filtermakers
// }

void displayFilter(HomeController homecontrol,context,MapController mapcontrol){


// print("aaaaaa");

    filterCard.clear();

    if(!filterVisible){
      filterCard.add(FilterStores(homecontrol,context,mapcontrol));
      filterVisible=true;
      print("aaaaaa");

    }
        else{

      filterCard.add(Container());
                      filterVisible=false;
                      print("bbbbbb");


    }

    update();
  
}

getfilteredMarkers(context,Category cat){

  if(cat.name=="all"){
    getMarkers(context);
  }
  else{
    final HomeController homecontrol = Get.put(HomeController());
              markers.clear();
print(markers.length);
        for (var store in homecontrol.stores){
          if(store.category.name==cat.name){
            markers.add(Marker(
                          icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: store.name,
              
              ),

            markerId: MarkerId(store.name),
            position: LatLng(store.lat,store.long),
            
            onTap: () {
              if(card.length>0){
                card.clear();
                card.add(StoreMapCard(context,
                  store,
                ),);
              }
              update();
            },
            ));
          }
          
        }
  }
  
        update();
}


getTapped(LatLng tapped,TextEditingController holder) async {
 // Geolocator geo=Geolocator();
  markers.clear();
  markers.add(Marker(
    markerId: MarkerId("1"),
    position: tapped

    ));
      List<Placemark> placemarks = await placemarkFromCoordinates(tapped.latitude,tapped.longitude);
      holder.text=placemarks[0].name+", "+placemarks[0].administrativeArea;
      print(placemarks[0]);

    
    // for(var p in placemarks){
    //   print(p);
    // }
    update();
}


addInitialMarker(TextEditingController holder,StoreController storecontrol) async {
  markers.add(
    Marker(
      markerId: MarkerId("1"),
      position: storecontrol.pos
    
    )
  );
  List<Placemark> placemarks = await placemarkFromCoordinates(36.8471779,10.2039552);
      holder.text=placemarks[0].name+", "+placemarks[0].administrativeArea;
 update();
 // markers=
}

void getSearchedMarkers(context,List<Store> stores){
markers.clear();
        for (var store in stores){
          markers.add(Marker(
                          icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: store.name,
              
              ),

            markerId: MarkerId(store.name),
            position: LatLng(store.lat,store.long),
            
            onTap: () {
              if(card.length>0){
                card.clear();
                card.add(StoreMapCard(context,
                  store,
                ),);
              }
              update();
            },
            ));
        }
        update();
}


void getMarkers(context){
  markers.clear();
  final HomeController homecontrol = Get.put(HomeController());
        for (var store in homecontrol.stores){
          markers.add(Marker(
                          icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: store.name,
              
              ),

            markerId: MarkerId(store.name),
            position: LatLng(store.lat,store.long),
            
            onTap: () {
              if(card.length>0){
                card.clear();
                card.add(StoreMapCard(context,
                  store,
                ),);
              }
              update();
            },
            ));
        }
        update();
}


@override
  void onInit() {
    filterVisible=false;
  //  filterCard=[Container()]; 
    update();
    // TODO: implement onInit
    super.onInit();
  }


  


void onMapCreate(GoogleMapController controller){
  if(!gcontrol.isCompleted){
               gcontrol.complete(controller);

  }

            
            print("blabla");
update();
}

void currentLocation(GoogleMapController control) async {
   //final GoogleMapController controller = await gcontrol.future;
  //  LocationData currentLocation;
  //  var location = new Location();

  //  try {
  //    currentLocation = await location.getLocation();

  //    print(currentLocation.longitude+currentLocation.latitude);
  //    } on Exception {

  //      currentLocation = null;
  //      }
            // currentLocation = await location.getLocation().catchError((e){print("moch blabla");});
             Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                 print("blabla");


    control.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(position.latitude, position.longitude),
        zoom: 17.0,
      ),
    ));
    update();
  }

}
