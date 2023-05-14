import 'package:flutter/material.dart';
import 'package:swimmer_app/core/constants/routes_manager.dart';
import 'package:swimmer_app/registeration/presenation/SignUpScreen.dart';
import 'package:swimmer_app/registeration/presenation/login_screen.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/welcome.jpg', // Replace with your image asset path
                height: 200.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'مرحبا في الاكاديمية',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                'assets/images/icon.jpg', // Replace with your logo asset path
                height: 100.0,
              ),
              SizedBox(height: 40.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  child: Text('تسجيل'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text('تسجيل الدخول'),
                ),
              ),
            ],
          ),
        ),
      ),
      upgrader: _buildUpgrader(),
    );
  }
}

_buildUpgrader() {
  return AppcastConfiguration(
    //i wannt to show the dialog only when there is a new version on the google play store
    //and not on the app store
    //so i will define the appcast url for each platform
      //android
      url: 'https://raw.githubusercontent.com/ahmedelsayed96/swimmer_app/master/android/app/src/main/appcast.xml',
      supportedOS: ['android'],
  );
}