import 'package:flutter/cupertino.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/widgets/home_widgets.dart';
import 'package:grocery_app/widgets/promotions_widgets.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            // CategoryItems(
            //   ),
              SizedBox(height:20),
              HomeBanner()
          ],
        ),
      ),
    );
  }
}
