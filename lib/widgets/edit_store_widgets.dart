import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/controllers/home_controller.dart';
import 'package:grocery_app/controllers/store_controller.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/styles/colors.dart';

Widget InputEdit(TextEditingController control,Store store,int lines){
  return TextFormField(
    //initialValue: store.description,
    maxLines: lines,
          controller: control,
          decoration: InputDecoration(
  focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),          ),
        );
}

Widget DropEdit(Store store,StoreController storecontrol,HomeController homecontrol){
 storecontrol.dropval=store.category.name;
List<String> catnames=List();
homecontrol.categories.forEach((element) { 
  catnames.add(element.name);
});
return DropdownButton<String>(
    value: storecontrol.dropval,
    icon: const Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      storecontrol.changeCategory(newValue);
      //  dropval = newValue;
   //     storecontrol.update();
    },
    items: catnames
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}






Widget OpenTime(Store store,StoreController storecontrol,context,TextEditingController closecontrol,TextEditingController opencontrol){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              AppText(
                text:"Open Time",
              
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),

        
        ],
      ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              AppText(
                text:"Open",
              
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),

          Row(
            children: [
                         TimeInput(storecontrol,context,opencontrol)

             
            ],
          ),
        ],
      ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              AppText(
                text:"Close",
              
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),

          Row(
            children: [
             
             TimeInput(storecontrol,context,closecontrol)
             
            ],
          ),
        ],
      ),
    ],
  );
}


Widget TimeInput(StoreController storecontrol,context,TextEditingController closecontrol){
  TimeOfDay selectedTime = TimeOfDay.now();

  return Container(
    width: 200,
    child: GestureDetector(
      onTap: (){
        storecontrol.selectTime(context,selectedTime,closecontrol);
      },
          child: AbsorbPointer(
            child: TextFormField(
              controller: closecontrol,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.alarm)
              ),
          
        ),
      ),
    ),
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


Widget Type(Store store,StoreController storecontrol,HomeController homecontrol){
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
          DropEdit(store,storecontrol,homecontrol)
          
        //  Text(store.category.name,
        //  style: TextStyle(
        //    fontSize: 18,
        //    color: Colors.black54,
        //    fontWeight: FontWeight.w600
        //  ),),
         
        ],
      ),
    ],
  );
}


Widget Address(Store store){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              AppText(
                text:"Address",
              
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),

          
        ],
      ),
      Row(
              children: [
               Container(width: 300,
               constraints: BoxConstraints(
                 maxWidth: 400
               ),
                 child: Text(store.address,
                   textAlign: TextAlign.right,
                   style: TextStyle(
                     
                     fontSize: 18,
                     color: Colors.black54,
                     fontWeight: FontWeight.w600
                   ),),
               ),
               SizedBox(width:20),
                           ElevatedButton(onPressed: (){}, child: Icon(Icons.location_on))

              ],
            ),
    ],
  );
}


Widget OpenDays(Store store,StoreController storecontrol){
  // bool ok=false;
  // storecontrol.colors=[["M",ok],["T",ok],["W",ok],["Th",ok],["F",ok],["Sa",ok],["S",ok],];
  // print(store.available.length);
  // for(int i=0;i<store.available.length;i++){

  //     int index=storecontrol.colors.indexWhere((element) =>
  //         element[0] == store.available[i],
  //       );
  // if(index>=0){
  //   storecontrol.colors[index][1]=true;
  // }
  //      }


       List<Widget> daywidgets=List();
       for(int i=0;i<storecontrol.colors.length;i++){
         daywidgets.add(Day(day:storecontrol.colors[i][0],open:storecontrol.colors[i][1],index:i,storecontrol: storecontrol,));
       }

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              AppText(
                text:"Open Days",
              
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),

          
        ],
        
      ),
      SizedBox(height: 15,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              for(var day in daywidgets)
                day
              // for(var c in storecontrol.colors)
              //   Day(day: c[0],open: c[1])
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

Widget Day({bool open,String day,int index,StoreController storecontrol}){

  Color color=Colors.red;
  if(open){
    color=Colors.green;
  }
  return Row(
    children: [
      InkWell(
          onTap: (){
            storecontrol.changeDay(open,index);
            print(day);
          },

              child: Container(
          width: 40,
          height: 40,
          
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: color
            )
          ),
          child: Center(
            child: Text(day,
            
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: color
              ),
            )
            ),
        ),
      ),
      SizedBox(width: 10,)
    ],
  );
}