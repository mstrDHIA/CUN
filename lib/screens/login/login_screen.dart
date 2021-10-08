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
    return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              
            
            LoginCard("Visitor",context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0),
              child: Text("Are you a?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white
              ),
              ),
            ),
                        LoginCard("Business Owner",context),

          ]),
        ),
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