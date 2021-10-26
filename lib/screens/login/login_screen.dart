import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/user_control.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/login_widgets.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    UserController usercontrol=Get.put(UserController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
        body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Padding(
               padding: const EdgeInsets.only(right:16.0),
               child: OwnerLoginCard("Business Owner",context),
             ),
           ],
         ),
      //LoginCard("Visitor",context),
      Center(
    child: Container(
      child: Column(
        children: [
          
        //   Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children:[
              
        //       Padding(
        //         padding: const EdgeInsets.only(top:36.0),
        //         child: FloatingActionButton(
        //           backgroundColor: Color(0xfffafafa),
        //           child: Padding(
        //             padding: const EdgeInsets.only(left:8.0),
        //             child: Icon(Icons.arrow_back_ios,
        //         color: Colors.black,),
        //           ),
        //         onPressed: (){
        //           Navigator.pop(context);
        //         }),
        //       ),
        //     ]
        // ),
        //   ),
                        // Image.asset("assets/images/cun_logo.png",
                        // height: 170,),

          VisitorLoginCard(usercontrol,context),
        ],
      ),
    ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical:20.0),
        child: Text("Welcome to CUN",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Colors.white
        ),
        ),
      ),
               //   LoginCard("Business Owner",context),

    ]),
        ),
      );
    // TODO: implement build
    throw UnimplementedError();
  }

}

// const users = const {
//   'dribbble@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };

// class LoginScreen extends StatelessWidget {
//   Duration get loginTime => Duration(milliseconds: 2250);

//   Future<String> _authUser(LoginData data) {
//     print('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }

//   Future<String> _recoverPassword(String name) {
//     print('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//             final UserController usercontrol = Get.put(UserController());

//     return Scaffold(
//       backgroundColor: Color(0XFFFAFAFA),
//           body: FlutterLogin(
//             hideSignUpButton: true,
            
//             hideForgotPasswordButton: true,
//             logo: "assets/images/cun_logo.png",
//             logoTag: "CUN",
//             theme: LoginTheme(
//               primaryColor: AppColors.primaryColor
//             ),
//         title: 'CUN',
//         loginProviders: [
//           LoginProvider(icon: FontAwesomeIcons.facebookF, 

//           label: "Facebook",
//           callback: () async {
//               print('start Facebook sign in');
//               await Future.delayed(loginTime);
//               print('stop Facebook sign in');              
//               return null;
//               }
//               ),
//                LoginProvider(icon: FontAwesomeIcons.google, 
          
//           label: "Google",
          
//           callback: () async {
//             return UserController.signInWithGoogle(context: context).toString();
//               // print('start google sign in');
//               // await Future.delayed(loginTime);
//               // print('stop google sign in');              
//               //  return null;
//           }
//               )
//         ],
//        // logo: 'assets/images/ecorp-lightblue.png',
//         onLogin: _authUser,
//         onSignup: _authUser,
//         onSubmitAnimationCompleted: () {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (context) => DashboardScreen(),
//           ));
//         },
//         onRecoverPassword: _recoverPassword,
//       ),
          
//     );
//   }
// }