
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/controllers/map_controller.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/store_controller.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/widgets/map_widgets.dart';
class ChooseFromMapScreen extends StatelessWidget{

   
    final TextEditingController searchcontrol=TextEditingController();
    
     GoogleMapController control;


  @override
  
  Widget build(BuildContext context) {
     
            final MapController choosemapcontrol = Get.put(MapController());
            final HomeController homecontrol = Get.put(HomeController());
            final StoreController storecontrol = Get.put(StoreController());
final CameraPosition _kGooglePlex = CameraPosition(
    target: storecontrol.pos,
    zoom: 14.4746,
  );
//mapcontrol.getMarkers(context);
//mapcontrol.filterVisible=true;
  // mapcontrol.displayFilter(homecontrol,context,mapcontrol);
  TextEditingController holder=TextEditingController();
  choosemapcontrol.markers.clear();
  choosemapcontrol.addInitialMarker(holder,storecontrol);
 return 
    GetBuilder<MapController>(
          builder: ( controller) { 
            return SafeArea(
                          child: Scaffold(
                            body: Stack(
          children:[ GoogleMap( 
                
                onMapCreated: (GoogleMapController c){
                  control = c;
                },
          markers: choosemapcontrol.markers,
          initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
           // markers: mapcontrol.markers,
           
                onTap: (argument) {
                  choosemapcontrol.getTapped(argument,holder);
                //  mapcontrol.card.clear();
           //   mapcontrol.card.add(Container());
           //   mapcontrol.update();
                },

        ),
        // Positioned(7
        //   bottom: 25,
        //   left: 75,
        //   child:  mapcontrol.card[0]
        //   ),
          Positioned(
                top: 15,
                left: 25,
                child: AddressHolder(holder)),
           
                // Positioned(
                //   right: 15,
                //   top: 100,
                //   child: mapcontrol.filterCard[0],
                // ),
          ]
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(
              child: Text("Confirm"),
              onPressed: (){

                   storecontrol.changeAddress(holder.text,choosemapcontrol.markers.first.position);
                   storecontrol.update();
                   Navigator.pop(context);

                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ,)));
              },
            ),
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: (){
                                Navigator.pop(context);
              },
            ),
          ],),
        ),
      )
              ),
            );
           },
          
    );
 
    // TODO: implement build
    throw UnimplementedError();
  }

}
















// import 'package:flutter/material.dart';
// import 'package:grocery_app/common_widgets/app_button.dart';
// import 'package:grocery_app/helpers/column_with_seprator.dart';
// import 'package:grocery_app/models/grocery_item.dart';
// import 'package:grocery_app/widgets/chart_item_widget.dart';

// import 'checkout_bottom_sheet.dart';

// class MapScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "My Cart",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: getChildrenWithSeperator(
//                   addToLastChild: false,
//                   widgets: demoItems.map((e) {
//                     return Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 25,
//                       ),
//                       width: double.maxFinite,
//                       child: ChartItemWidget(
//                         item: e,
//                       ),
//                     );
//                   }).toList(),
//                   seperator: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 25,
//                     ),
//                     child: Divider(
//                       thickness: 1,
//                     ),
//                   ),
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//               ),
//               getCheckoutButton(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getCheckoutButton(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       child: AppButton(
//         label: "Go To Check Out",
//         fontWeight: FontWeight.w600,
//         padding: EdgeInsets.symmetric(vertical: 30),
//         trailingWidget: getButtonPriceWidget(),
//         onPressed: () {
//           showBottomSheet(context);
//         },
//       ),
//     );
//   }

//   Widget getButtonPriceWidget() {
//     return Container(
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         color: Color(0xff489E67),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Text(
//         "\$12.96",
//         style: TextStyle(fontWeight: FontWeight.w600),
//       ),
//     );
//   }

//   void showBottomSheet(context) {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (BuildContext bc) {
//           return CheckoutBottomSheet();
//         });
//   }
// }
