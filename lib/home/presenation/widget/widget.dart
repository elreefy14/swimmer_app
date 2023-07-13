import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../business_logic/Home/home_cubit.dart';
import '../../business_logic/Home/home_state.dart';
//class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(InitialState()) {
//     // Call this method when connectivity changes
//    // _listenToConnectivityChanges();
//     //initControllers();
//   }
//   final List<Widget> _screens = [
//     DashBoard(),
//     QrScreen(),
//     ScreenThree(),
//     NotificationScreen(),
//     EditProfile(),
//   ];
//use this cubit to change the bottom nav bar index

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Container(
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .06),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
            });
            HomeCubit.get(context).changeBottomNav(currentIndex);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth * .22,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? screenWidth * .12 : 0,
                    width: index == currentIndex ? screenWidth * .22 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? //#2196F3
                          Color(0xff2196F3)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * .22,
                alignment: Alignment.center,

               child: SvgPicture.asset(
                HomeCubit.get(context).listOfIcons[index],
                height: 24.h,
                width: 24.w,
                color: index == currentIndex
                    ? //##FFFFFF
                    Color(0xffFFFFFF)
                    : Colors.black26,

               ),
              )
                ],
          ),
        ),
      ),
    );
  },
);
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}