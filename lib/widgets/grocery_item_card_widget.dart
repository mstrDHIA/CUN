import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/models/store.dart';
import 'package:grocery_app/screens/store_details/store_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';

class GroceryItemCardWidget extends StatelessWidget {
  GroceryItemCardWidget({Key key, this.store}) : super(key: key);
  final Store store;

  final double width = 174;
  final double height = 250;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  child: imageWidget(),
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
              ),
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

  Widget imageWidget() {
    return Container(
      child: Image.network(store.image,width: 500,height:500),
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
