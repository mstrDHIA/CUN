 import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/screens/stores/explore_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'grocery_item_card_widget.dart';
Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }




  Widget CategoriesyStores(HomeController control){
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
  size: AdSize.largeBanner,
  request: AdRequest(),
  listener: listener,
);
final AdWidget adWidget = AdWidget(ad: myBanner);

    List<Widget> categoriesAds=[];
    for(int i=0;i<control.categories.length;i++){
      categoriesAds.add(CategoryStore(control, control.categories[i]));
      if(i%2!=0){
        categoriesAds.add(Column(
          children: [
            SizedBox(height:20),
            Container(
  alignment: Alignment.center,
  child: adWidget,
  width: myBanner.size.width.toDouble(),
  height: myBanner.size.height.toDouble(),
),
            SizedBox(height:10),

          ],
        ),);
        myBanner.load();

      }
    }

    return Column(children: [
      for(var catad in categoriesAds)
      catad,
              // for(var category in control.categories)
              // CategoryStore(control, category)

    ],);
  }


Widget CategoryStore(HomeController control,Category category){
  final foundstores = control.stores.where((element) =>
        element.category.name == category.name);
  final List<Store> storet =foundstores.toList();
        
  
  return Column(
    children: [
      SizedBox(
                          height: 15,
                        ),
                  padded(subTitle(category.name)),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 250,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: storet.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onItemClicked(context, storet[index]);
                },
                child: GroceryItemCardWidget(
                  store: storet[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 20,
              );
            },
          ),
        ),
    ],
  );
}

  // Widget getHorizontalItemSlider(List<GroceryItem> items) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     height: 250,
  //     child: ListView.separated(
  //       padding: EdgeInsets.symmetric(horizontal: 20),
  //       itemCount: items.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             onItemClicked(context, ite[index]);
  //           },
  //           child: GroceryItemCardWidget(
  //             store: item[index],
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) {
  //         return SizedBox(
  //           width: 20,
  //         );
  //       },
  //     ),
  //   );
  // }

  void onItemClicked(BuildContext context, Store store) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StoreDetailsScreen(store)),
    );
  }

  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget locationWidget() {
    String locationIconPath = "assets/icons/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Khartoum,Sudan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }


    Widget HomeBanner() {
    return Container(
      width: 350,
      height: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/banner_background.png",
              ),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              "assets/images/banner_image.png",
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "Fresh Vegetables",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: "Get Up To 40%  OFF",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }



  Widget SearchBarWidget(HomeController control,TextEditingController searchcontrol,context){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: 280,
          decoration: BoxDecoration(
            color: Color(0xFFF2F3F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
           // autofillHints: control.stores.,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              
              hintText: "Search Store",
              border:InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900
              )

            ),
            onFieldSubmitted: (value){
              final found =
      control.stores.where((element) =>
          element.name.toLowerCase().contains(value.toLowerCase()),
      ).toList();
  if(found!=null){
    // print("found "+searchcontrol.text);
              Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExploreScreen(foundStores: found,keyword: value,)),
    );
  }
    //           Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => StoreDetailsScreen(store)),
    // );
            },
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SvgPicture.asset(
          //       "assets/icons/search_icon.svg",
          //     ),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Text(
          //       "Search Store",
          //       style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: Color(0xFF7C7C7C)),
          //     )
          //   ],
          // ),
        ),
        SizedBox(
                width: 20,
              ),
               Container(
          padding: EdgeInsets.all(4),
          width: 78,
          decoration: BoxDecoration(
            color: Color(0xFFF2F3F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(icon: Icon(Icons.filter_list),onPressed: (){},)
        ),

      ],
    );

  }

    Widget ImageSlide(HomeController control){
     List<Image> images=[];
     for(var ad in control.ads){
       images.add(Image.network(ad));
     }
      return CarouselSlider(
        items: images,

         options: CarouselOptions(
            viewportFraction: 1,

           aspectRatio: 2,
           initialPage: 0,
           autoPlay: true,
           autoPlayAnimationDuration: Duration(seconds: 1),
           pauseAutoPlayOnTouch: true,
           enlargeCenterPage: true,
           enableInfiniteScroll: false,


           ),);
    }