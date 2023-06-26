import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/constants/routes_manager.dart';
import 'package:swimmer_app/registeration/presenation/SignUpScreen.dart';
import 'package:swimmer_app/registeration/presenation/login_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 54.0.h),
              Image.asset(
                'assets/images/chatEmpty@2x.png', // Replace with your logo asset path
                height: 200.0.h,
                width: double.infinity,
              ),
              SizedBox(height: 5.0.h),
              Container(

                //height: 30,
                alignment: Alignment.center,
                child: Text(
                  'مرحبا في اكاديمية',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    height: 29 / 24,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Container(
                //height: 30,
                alignment: Alignment.center,
                child: Text(
                  'Future Trainers Academy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Devanagari',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 37 / 24,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              Image.asset(
                'assets/images/chatEmpty@2x.png', // Replace with your logo asset path
                height: 88.0.h,
                width: 88.0.w,
              ),
              SizedBox(height: 30.0.h),
            Padding(
              padding: EdgeInsets.only(
                  left: 31.w,
                  right: 31.w,
                  top: 30.h
              ),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    'تسجيل ',
                    style: TextStyle(
                      fontFamily: 'Montserrat-Arabic',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 26 / 18,
                      color: Color(0xFFFFFFFF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2196F3), // Background color
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18, // Adjust the font size if needed
                    ),
                  ),
                ),
              ),

            ),
              SizedBox(height: 10.0.h),
          Padding(
            padding: EdgeInsets.only(
                left: 31.w,
                right: 31.w,

            ),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signUp);
                },
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 26 / 18,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  //use this colot background: #F4F4F4;
                 primary: Color(0xFFF4F4F4), // Background color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18, // Adjust the font size if needed
                  ),
                ),
              ),
            ),

          ),
            ],
          ),
        ));


  }
}

