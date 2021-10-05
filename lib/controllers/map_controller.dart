import 'dart:async';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
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

void displayFilter(HomeController homecontrol){


print("aaaaaa");

    filterCard.clear();

    if(!filterVisible){
      filterCard.add(FilterStores(homecontrol));
      filterVisible=true;
    }
        if(filterVisible){

      filterCard.add(Container());
                      filterVisible=false;

    }

    
    update();
  
}

void getMarkers(context){
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
