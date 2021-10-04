import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class MapController extends GetxController {
final Completer<GoogleMapController> gcontrol = Completer();
void onMapCreate(GoogleMapController controller){
               gcontrol.complete(controller);

            
            print("blabla");

}

void currentLocation() async {
   final GoogleMapController controller = await gcontrol.future;
   LocationData currentLocation;
   var location = new Location();
   try {
     currentLocation = await location.getLocation();
     } on Exception {
       currentLocation = null;
       }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
    update();
  }

}
