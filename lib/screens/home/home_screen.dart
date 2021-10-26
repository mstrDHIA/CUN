import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/widgets/category_item_card_widget.dart';
import 'package:grocery_app/widgets/home_widgets.dart';
import 'package:grocery_app/widgets/search_bar_widget.dart';
import '../../controllers/home_controller.dart';
import 'category_featured_Item_widget.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchcontrol=TextEditingController();
  @override
  Widget build(BuildContext context) {
        final HomeController homecontrol = Get.put(HomeController());
        //homecontrol.getStores();
        final BannerAdListener listener = BannerAdListener(
 // Called when an ad is successfully received.
 onAdLoaded: (Ad ad) => print('Ad loaded.'),
 // Called when an ad request failed.
 onAdFailedToLoad: (Ad ad, LoadAdError error) {
   // Dispose the ad here to free resources.
   ad.dispose();
   print('Ad failed to load: $error');
 },
 // Called when an ad opens an overlay that covers the screen.
 onAdOpened: (Ad ad) => print('Ad opened.'),
 // Called when an ad removes an overlay that covers the screen.
 onAdClosed: (Ad ad) => print('Ad closed.'),
 // Called when an impression occurs on the ad.
 onAdImpression: (Ad ad) => print('Ad impression.'),
);
  final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid?'ca-app-pub-3940256099942544/6300978111':'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: listener,
);
myBanner.load();
final AdWidget adWidget = AdWidget(ad: myBanner);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   leading: IconButton(icon:Icon(Icons.menu), onPressed:(){} ),
      //   title: Text("CUN"),
      //   actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))],),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
        
                 // padded(ImageSlide(homecontrol)),
                 ImageSlide(homecontrol),
                  SizedBox(
                    height: 25,
                  ),
                   Container(
  alignment: Alignment.center,
  child: adWidget,
  width: myBanner.size.width.toDouble(),
  height: myBanner.size.height.toDouble(),
),
                  // adWidget,
                  SizedBox(
                    height: 25,
                  ),
                  padded(SearchBarWidget(homecontrol,searchcontrol,context)),
                  SizedBox(
                    height: 25,
                  ),
                  padded(subTitle("Categories")),
                  SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 105,
                    child:
              CategoryFeaturedCard()
          
                   
                  ),
                  SizedBox(
                          height: 5,
                        ),
                  CategoriesyStores(homecontrol),
                  //getHorizontalItemSlider(exclusiveOffers),
                  SizedBox(
                    height: 15,
                  ),
                 // padded(subTitle("Health")),
                  //getHorizontalItemSlider(bestSelling),
                  SizedBox(
                    height: 15,
                  ),
                  
                  
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 
}
