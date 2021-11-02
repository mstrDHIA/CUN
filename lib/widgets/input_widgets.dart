import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Future<Null> _selectDate(BuildContext context,TextEditingController control) async {
  DateTime selectedDate = DateTime.now();

  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100));
  if (picked != null && picked != selectedDate)
    // setState(() {
    //   selectedDate = picked;
    //   _date.value = TextEditingValue(text: picked.toString());
   // }
   selectedDate = picked;
      control.value = TextEditingValue(text: picked.toString());
          
}


Future getImage() async {
            final ImagePicker _picker = ImagePicker();


                  final XFile image = await _picker.pickImage(source: ImageSource.gallery);
                  print(image.name);
}
Widget ImageInput(Icon icon){
          return FloatingActionButton(
            child: icon,
            onPressed: ()  { 
            getImage();
           },);

}




Widget DateInput({BuildContext context,String hint, Icon icon, TextEditingController control}){
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text (
          hint,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
        
              child: GestureDetector(
                onTap: (){
                  _selectDate(context,control);
                },
                              child: AbsorbPointer(
                                child: TextFormField(
                   
                      keyboardType: TextInputType.datetime,
                      controller: control,
                      decoration: InputDecoration(
                        hintText: hint,
                        suffixIcon: icon
                      ),
                    ),
                ),
              ),
              
                          
            )),
      
    ],
  );
}



Widget Input({String hint, Icon icon, TextEditingController control,TextInputType type, bool expands}) {
  int max=1;
  int min=1;
  double sizedHeight=30;
  double h=300;
  if(hint=="description"){
    max=5;
  }
  if(hint==""){max=5;
  sizedHeight=0;
  h=350;
  }
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text (
          hint,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        width: sizedHeight,
      ),
      Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
        
              child: TextFormField(
                  expands: expands,
                  maxLines: max,
                  minLines: min,
                  keyboardType: type,
                  controller: control,
                  decoration: InputDecoration(
                    hintText: hint,
                    suffixIcon: icon
                  ),
                ),
              
                          
            )),
      
    ],
  );
}
