
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/map_controller.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/home_widgets.dart';



Widget filter_bar(HomeController homeControl){

}

  Widget SearchBarWidget(HomeController control,MapController mapController,TextEditingController searchcontrol,context){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: 280,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius:20,
                spreadRadius:2,
                offset:Offset(2,3)
              )
            ],
            color: Color(0xFFFFFFFF),
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
      mapController.getSearchedMarkers(context,found);
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
                           height: 60,

          padding: EdgeInsets.all(4),
          width: 78,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius:20,
                spreadRadius:2,
                offset:Offset(2,3)
              )
            ],
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(icon: Icon(Icons.filter_list),onPressed: (){
            mapController.displayFilter(control,context,mapController);
            mapController.update();
          },)
        ),

      ],
    );

  }


Widget FilterStores(HomeController homecontrol,context,control){
              Category all=Category("all","https://firebasestorage.googleapis.com/v0/b/cun-app.appspot.com/o/oil.png?alt=media&token=baa95f1b-b48f-4632-bab8-5b4e3ce380d4","1");

  return Container(
    width: 100,
    decoration: BoxDecoration(
      color: Colors.white
    ),
    child:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
                                                      CategoryItem(all,context,control),

        Flexible(
          fit: FlexFit.loose,
              child: ListView.builder(

                shrinkWrap: true,
            
            itemCount: homecontrol.categories.length,
            
            itemBuilder: (context,index){
            //   onItemClicked(context, value){
            //  //   filter(store);
            //  print(value);
            //   }
                   return Column(
                     children: [

                       CategoryItem(homecontrol.categories[index],context,control),
                     ],
                   );

          }),
        ),
      ],
    )
    // child:Column(
    //     mainAxisSize: MainAxisSize.min,
        
    //     children: [
    // Text("______"),
    //     for(var cat in homecontrol.categories)
    //     CategoryItem(cat),
    //   ],)
  );
}


Widget CategoryItem(Category cat,context,MapController control){
  return InkWell(
    onTap: (){
      control.getfilteredMarkers(context, cat);
      //print(cat.name);

    },
      child: Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                 // SizedBox(height: 10,),

            Image.network(cat.image,
            width: 50,
            ),
                        SizedBox(height: 10,),

            Text(cat.name),
           // SizedBox(height: 10,),
            Text("______")
          ],
        ),
    ),
      ),
  );
}



Widget StoreMapCard(context,Store store){
    final double width = 280;
  final double height = 200;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 20;
  return InkWell(
    borderRadius:BorderRadius.circular(
        borderRadius,
      ),
    onTap: (){
        Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StoreDetailsScreen(store)),
    );
      },
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(2,6)
          )
        ],
        color: Colors.white,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: imageWidget(store),
                ),
              ),
              Divider(
                thickness: 2,
              ),
             SizedBox(
               height:10
             ),
              AppText(
                text: store.name,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: store.address,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7C7C7C),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AppText(
                  textAlign: TextAlign.center,
                  text: store.opentime.toDate().hour.toString()+":"+
                  store.opentime.toDate().minute.toString()+"h ~ "+
                  store.closetime.toDate().hour.toString()+":"+
                  store.closetime.toDate().minute.toString()+"h",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Row(
                children: [
                  // AppText(
                  //   text: "\$${item.price.toStringAsFixed(2)}",
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  Spacer(),
                 // addWidget()
                ],
              )
            ],
          ),
        ),
    ),
  );
  }




  Widget imageWidget(Store store) {
    return Container(
      child: Image.network(store.image,width: 500,height:500),
    );
  }