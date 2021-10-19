import 'package:flutter/material.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/input_widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPromotionScreen extends StatelessWidget{
  TextEditingController titlecontrol=TextEditingController();
    TextEditingController desccontrol=TextEditingController();
  TextEditingController begincontrol=TextEditingController();
  TextEditingController endcontrol=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        //leading: IconButton(icon:Icon(Icons.menu), onPressed:(){} ),
        title: Text("CUN"),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))],),
    
        body:Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2,3)
            )
          ]
        ),
        height: 420,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10,),
           Input(control: titlecontrol,hint: "code           ",icon: Icon(Icons.code), type: TextInputType.number,expands: false,),
           SizedBox(height: 10,),

           Input(control: titlecontrol,hint: "title             ",icon: Icon(Icons.title), type: TextInputType.text,expands: false,),
           SizedBox(height: 20,),
           Input(control: desccontrol,hint: "description",icon: Icon(Icons.title), type: TextInputType.text,expands: false),
                        SizedBox(height: 20,),

           DateInput(control: begincontrol,hint: "begin date",icon: Icon(Icons.date_range),context: context),
                        SizedBox(height: 20,),

           DateInput(control: endcontrol,hint: "end date   ",icon: Icon(Icons.date_range),context: context ),
                        SizedBox(height: 20,),
           ImageInput(Icon(Icons.camera)),
          ],),
        ),
      ),
    ),
        ),
        bottomNavigationBar: BottomAppBar(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: ElevatedButton(child: Text("Confirm"),
                    onPressed: (){},
                ),
              ),
            ],
          )
        ),
      );
    // TODO: implement build
    throw UnimplementedError();
  }

}