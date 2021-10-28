import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_app/controllers/feedback_controller.dart';

class SendFeedbackScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    FeedbackController feedcontrol=Get.put(FeedbackController());
    return GetBuilder<FeedbackController>(builder: (GetxController controller){
      return Scaffold(
        appBar: AppBar(title:Text("CUN")),
        body: Column(
          children: [
            Image.asset("assets/images/Bugfixing.gif"),
            Text("Here is feedback"),
          ],
        ),
      );

    });
    // TODO: implement build
    throw UnimplementedError();
  }
}