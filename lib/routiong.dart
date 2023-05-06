import 'package:flutter/material.dart';
import 'package:swimmer_app/home/presenation/home_lauout.dart';
import 'package:swimmer_app/registeration/presenation/SignUpScreen.dart';
import 'package:swimmer_app/registeration/presenation/home.dart';
import 'package:swimmer_app/registeration/presenation/login_screen.dart';
import 'package:swimmer_app/registeration/presenation/otp.dart';


import 'core/constants/routes_manager.dart';
import 'core/constants/strings.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     var args = settings.arguments;
    switch (settings.name) {
      //HomeScreen
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case AppRoutes.signUp:
          return MaterialPageRoute(builder: (_) =>SignUpScreen());
        case AppRoutes.login:
          return MaterialPageRoute(builder: (_) =>SignInScreen());
           case AppRoutes.home:
             return MaterialPageRoute(builder: (_) =>HomeLayout());
             //case OtpVerificationScreen
             // Navigator.pushNamed(
             //   context,
             //   AppRoutes.otpVerification,
             //   arguments: {
             //     'phone': phoneController.text,
             //     'lName': lastNameController.text,
             //     'fName': firstNameController.text,
             //     'password': passwordController.text,
             //   },
             // );
      case AppRoutes.otpVerification:
        final args = settings.arguments;
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(builder: (_) => OtpVerificationScreen(
            phoneNumber: args['phone'],
            fName: args['fName'],
            lName: args['lName'],
            password: args['password'],
          ));
        }else{
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRoutes),
        ),
        body: const Center(
          child: Text(AppStrings.noRoutes),
        ),
      );
    });
  }
}
