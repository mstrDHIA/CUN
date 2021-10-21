import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/login/business_owner_login_screen.dart';
import 'package:grocery_app/screens/login/visitor_login_screen.dart';
import 'package:grocery_app/styles/colors.dart';


Widget VisitorLoginCard(UserController usercontrol,context){
  return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20,
          color: Colors.black38,
          offset: Offset(2,3),
          spreadRadius: 2
          ),
        ],
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        Text("Only one click to join us",
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.w600
        ),
        ),
                SizedBox(height: 40,),

                Divider(thickness: 2,),

        SizedBox(height: 60,),
        FloatingActionButton(onPressed: (){
                      usercontrol.facebookSignin(context);

        },
        child:Icon(FontAwesomeIcons.facebookF)
        )
      ],)
    );
}


Widget BusinessOwnerLoginCard(UserController usercontrol,context,TextEditingController emailcontrol,TextEditingController psdcontrol){
  return Container(
      width: 350,
      height: 450,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20,
          color: Colors.black38,
          offset: Offset(2,3),
          spreadRadius: 2
          ),
        ],
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                                //SizedBox(height: 10,),

        Text("login to your store",
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.w600
        ),
        ),
                        SizedBox(height: 20,),

                Divider(thickness: 2,),
                                        SizedBox(height: 20,),
    

      Input("email        ",emailcontrol),
      SizedBox(height: 10,),
      Input("password",psdcontrol),
                SizedBox(height: 20,),
                // SizedBox(height: 60,),
        ElevatedButton(onPressed: (){
                 //     usercontrol.facebookSignin(context);
            usercontrol.businessLogin(emailcontrol,psdcontrol,context);
        },
        child:Container(
          width: 100,
          child: Center(child: Text("Submit")))
        ),
                SizedBox(height: 10,),

                Divider(thickness: 2,),
                                SizedBox(height: 15,),

      Text("Or if you're new",
      style: TextStyle(
        fontSize: 20
      ),
      ),
                      SizedBox(height: 10,),

      TextButton(onPressed: () { 
        print("this is text button");
       },
      child: Text("Join Us",
      style: TextStyle(
        fontSize: 30,

      ),),)
       
      ],)
    );
}


Widget OwnerLoginCard(String type,context){
  
  return InkWell(
    onTap: (){
      if(type=="Visitor"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitorLoginScreen()));
      }
      else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessOwnerLoginScreen()));

      }
    },
      child: Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20,
          color: Colors.black38,
          offset: Offset(2,3),
          spreadRadius: 2
          ),
        ],
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: CardContent(type),
    ),
  );
}


Widget LoginCard(String type,context){
  
  return InkWell(
    onTap: (){
      if(type=="Visitor"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitorLoginScreen()));
      }
      else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessOwnerLoginScreen()));

      }
    },
      child: Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20,
          color: Colors.black38,
          offset: Offset(2,3),
          spreadRadius: 2
          ),
        ],
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: CardContent(type),
    ),
  );
}



Widget Input(String hint,TextEditingController control){
  bool secret=false;
  if(hint=="password"){
    secret=true;
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(hint,
      style: TextStyle(fontSize: 20,
      ),),
      Container(
        width: 200,
        child: TextFormField(
          obscureText: secret,
          controller: control,
          decoration: InputDecoration(
            hintText: hint,
  focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),          ),
        )),
    ],
  );
}


Widget CardContent(String type){
  String ch="assets/images/businessman.png";
  double h=50;
  if(type=="Visitor"){
    ch="assets/images/client.png";
    h=150;
  }
  
  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(ch,
      height: h,),
      SizedBox(height: 5,),
      // Text(type,
      // style: TextStyle(color: Colors.black,
      // fontSize: 24,
      // fontWeight: FontWeight.w500

      // ),
      // ),
    ],
  ));
}