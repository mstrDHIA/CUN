import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/store_controller.dart';
import 'package:grocery_app/models/store.dart';
import 'package:photo_view/photo_view.dart';



Widget OpenTime(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Open Time",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text("${store.opentime.toDate().hour}:${store.opentime.toDate().minute}~${store.closetime.toDate().hour}:${store.closetime.toDate().minute}",
         style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}



Socials(store){
  return Column(children:[
  for(var social in store.social)
    Column(
      children: [
        SizedBox(height: 20,),
            Social(social)

      ],
    ),

  ]);

}

Widget Social(String social){
  List<String> s=social.split(":");
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:s[0],
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text(s[1],
            style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}


Widget Phone(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Phone",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text(store.phone.toString(),
            style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}



Widget Email(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Email",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text(store.email,
            style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}



Widget Manager(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Manager",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text(store.manager,
         style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}


Widget Type(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Category",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
         Text(store.category.name,
         style: TextStyle(
           fontSize: 18,
           color: Colors.black54,
           fontWeight: FontWeight.w600
         ),),
         
        ],
      ),
    ],
  );
}


Widget Address(Store store){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Address",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
          children: [
           Container(width: 300,
           constraints: BoxConstraints(
             maxWidth: 400
           ),
             child: Text(store.address,
               
               style: TextStyle(
                 fontSize: 18,
                 color: Colors.black54,
                 fontWeight: FontWeight.w600
               ),),
           ),
           
          ],
        ),
    ],
  );
}


Widget OpenDays(Store store){
  bool ok=false;
  List colors=[["M",ok],["T",ok],["W",ok],["Th",ok],["F",ok],["Sa",ok],["S",ok],];
  print(store.available.length);
  for(int i=0;i<store.available.length;i++){

      int index=colors.indexWhere((element) =>
          element[0] == store.available[i],
        );
  if(index>=0){
    colors[index][1]=true;
  }
       }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          AppText(
            text:"Open Days",
          
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),

      Row(
        children: [
          for(var c in colors)
            Day(day: c[0],open: c[1])
          // Day(day: "M",open: true),
          // Day(day: "T",open: true),
          // Day(day: "W",open: true),
          // Day(day: "Th",open: true),
          // Day(day: "F",open: true),
          // Day(day: "S",open: false),
          // Day(day: "Sa",open: false),
        ],
      ),
    ],
  );

}



   Widget ImageSlide({Store store,context}){
     List<Widget> images=[];
     List<Widget> imagesNatural=[];
     double h=300;
     double w=400;
     for(int i=0;i<store.images.length;i++){
        imagesNatural.add(PhotoView(
          
                  imageProvider: NetworkImage(store.images[i],
          // height: 600,
          scale: 0.6,
          // width: 700,
          ),
        ));

       images.add(Container(
         height: 300,
         width: 400,
         constraints: BoxConstraints(
           maxHeight:300,
           maxWidth: 400
         ),
         child: InkWell(
           onTap:() {
             showDialog(context: context, builder: (context)=>SimpleDialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      titlePadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),

               children: [
                //  Image.network(store.images[i])
                CarouselSlider(
        items: imagesNatural,

         options: CarouselOptions(
            // viewportFraction: 1,
            viewportFraction: 1,
            aspectRatio: 1,
            // height: 500,
           initialPage: i,
          //  height: 400,
          //  autoPlay: true,
          //  autoPlayAnimationDuration: Duration(seconds: 1),
          //  pauseAutoPlayOnTouch: true,
          //  enlargeCenterPage: true,
           enableInfiniteScroll: false,


           ),)
    
                 ],
             ));},
           child: Image.network(store.images[i],
           height: h,
           width: w,
           )
           ),
       )
         );
     }
      return CarouselSlider(
        items: images,

         options: CarouselOptions(
            viewportFraction: 0.6,
            
          //  aspectRatio: 2,
          //  height: 300,
           initialPage: 0,
           autoPlay: true,
           autoPlayAnimationDuration: Duration(seconds: 1),
           pauseAutoPlayOnTouch: true,
           enlargeCenterPage: true,
           enableInfiniteScroll: false,


           ),);
    }

Widget ImagesList({Store store,context}){

return ImageSlide(store: store,context: context);

}

Widget Day({bool open,String day}){
  Color color=Colors.red;
  if(open){
    color=Colors.green;
  }
  return Row(
    children: [
      Container(
        width: 25,
        height: 25,
        
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: color
          )
        ),
        child: Center(
          child: Text(day,
          
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: color
            ),
          )
          ),
      ),
      SizedBox(width: 1,)
    ],
  );
}