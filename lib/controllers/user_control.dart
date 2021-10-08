import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/screens/login_success_screen.dart';

class UserController extends GetxController{
  



businessLogin(TextEditingController emailcontrol,TextEditingController psdcontrol,context) async {
if(emailcontrol.text.isEmpty|psdcontrol.text.isEmpty){
  final snackBar = SnackBar(
    duration: Duration(seconds:3),
    content: Text("You can't leave required fields empty"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar,

  );

  print("You can't leave required fields empty");
}
else{
  FirebaseApp app = await Firebase.initializeApp();
   // print("Firebase initialized");

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Users").where('email',isEqualTo:emailcontrol.text).get().then((querySnapshot) {
      //print(querySnapshot.);
      if(querySnapshot.docs.isEmpty){
        final snackBar = SnackBar(
    duration: Duration(seconds:3),
    content: Text("This account doesn't exist"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar,

  );
        print("This account doesn't exist");
      }
      else
      {
        querySnapshot.docs.forEach((element) {print(element.data());
            //print(element['password']);
      if(element["password"]==psdcontrol.text){
        print("login success");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSuccessScreen()));
      }
      else{
          final snackBar = SnackBar(
    duration: Duration(seconds:3),
    content: Text("Wrong password"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar,

  );
        print("Wrong password");
      }
      });
      }
    });
}
}

 static Future<User> signInWithGoogle({ BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;




    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }



void facebookSignin(context) async {
  final LoginResult result = await FacebookAuth.instance.login( permissions: ['public_profile', 'email', 'user_birthday', 'user_gender', 'user_link']); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    FirebaseAuth auth = FirebaseAuth.instance;

if (result.status == LoginStatus.success) {
    // you are logged
    //result.printInfo();
    //print(result.)
    final AccessToken accessToken = result.accessToken;
  
    final userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200),birthday,gender,link",
    );
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
    // Once signed in, return the UserCredential
     UserCredential i=await FirebaseAuth.instance.signInWithCredential(credential);
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //FirebaseFirestore.instance.collection('Users').add(i.user.uid)
  // print(i.user.);
   DocumentReference j=await users.doc(i.user.uid);
   j.set(
           {
             "name":i.user.displayName,
             "email":i.user.email,
      //       "phone":i.user.phoneNumber
           }
   );
          // .then((value) => print("User Added"))
          // .catchError((error) => print("Failed to add user: $error"));
    //print(accessToken.);
    print("login success");
    Navigator.push(context, MaterialPageRoute(builder:   (context) => DashboardScreen()),);
} else {
    print(result.status);
    print(result.message);
}

}


// Future<UserCredential> signInWithGoogle() async {
//   // FirebaseAuth auth = FirebaseAuth.instance;
//   //   FirebaseAuth.instance
//   // .userChanges()
//   // .listen((User user) {
//   //   if (user == null) {
//   //     print('User is currently signed out!');
//   //   } else {
//   //     print('User is signed in!');
//   //   }
//   // });

//   // Trigger the authentication flow
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
  

  Login(){
    
  }

}
