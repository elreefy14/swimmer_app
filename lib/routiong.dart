import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swimmer_app/home/presenation/home_lauout.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/registeration/presenation/SignUpScreen.dart';
import 'package:swimmer_app/registeration/presenation/welcome_screen.dart';
import 'package:swimmer_app/registeration/presenation/login_screen.dart';
import 'package:swimmer_app/registeration/presenation/otp.dart';


import 'core/constants/routes_manager.dart';
import 'core/constants/strings.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
    //HomeScreen
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => LoginCubit(),
              child: SignInScreen(),
            ));
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeLayout());
    //EditProfile
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfile());
      // default:
      //   return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    // Exit the app if there is no route defined for the given route settings
    return MaterialPageRoute(builder: (_) {
      WidgetsBinding.instance.addPostFrameCallback((_) => exit(0));
      return Container();
    });
  }
}