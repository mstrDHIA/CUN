
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/controllers/map_controller.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/widgets/map_widgets.dart';
class MapScreen extends StatelessWidget{
    final TextEditingController searchcontrol=TextEditingController();
    static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.8471779, 10.2039552),
    zoom: 14.4746,
  );
    GoogleMapController control;

  @override
  Widget build(BuildContext context) {
            final MapController mapcontrol = Get.put(MapController());
            final HomeController homecontrol = Get.put(HomeController());
mapcontrol.getMarkers(context);
mapcontrol.filterVisible=true;
   mapcontrol.displayFilter(homecontrol);
 return 
    GetBuilder<MapController>(
          builder: ( controller) { 
            return Stack(
          children:[ GoogleMap( 
            
            onMapCreated: (GoogleMapController c){
              control = c;
            },
          
          initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            markers: mapcontrol.markers,
           
            onTap: (argument) {
              mapcontrol.card.clear();
              mapcontrol.card.add(Container());
              mapcontrol.update();
            },

        ),
        Positioned(
          bottom: 25,
          left: 75,
          child:  mapcontrol.card[0]
          ),
          Positioned(
            top: 15,
            left: 25,
            child: SearchBarWidget(homecontrol,mapcontrol,searchcontrol, context)),
           
            Positioned(
              right: 27,
              top: 100,
              child: mapcontrol.filterCard[0]
              ),
          ]
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
