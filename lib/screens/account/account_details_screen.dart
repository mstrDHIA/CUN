import 'package:flutter/material.dart';
import 'package:grocery_app/models/user.dart';
import 'package:grocery_app/styles/colors.dart';

class AccountDetailsScreen extends StatelessWidget{
  final User user;

  const AccountDetailsScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("CUN"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xfffafafa),
              ))
        ],
      ),
          body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children:[
              Center(child: Image.network(user.photo,
              scale: 0.5,
            )

              ,),
              SizedBox(height:8),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user.firstName,
                        style: TextStyle(
                          fontSize: 20,

                        ),
                        ),
                      ],
                    ),
                    SizedBox(height:20),
                    Row(
                  children: [
                    Text(user.email,
                     style: TextStyle(
                          fontSize: 18,
                          
                        ),),
                  ],
                )
                  ],
                ),
              ),
              

            ]
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}