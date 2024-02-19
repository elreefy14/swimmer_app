import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swimmer_app/home/business_logic/Home/dash_board_cubit.dart';
import 'package:swimmer_app/home/presenation/home_lauout.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/registeration/presenation/welcome_screen.dart';
import 'package:swimmer_app/registeration/presenation/login_screen.dart';


import 'core/constants/routes_manager.dart';

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
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => DashBoardCubit()..getUserData(),
              child: HomeLayout(),
            ));
    }
  }

}