import 'package:flutter/material.dart';
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
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
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
   // Navigator.push(
  //    context,
  //    MaterialPageRoute(builder: (context) => SignInScreen()),
  //  );
    },
    child: Text('تسجيل الدخول'),
  ),
),
          ],
        ),
      ),
    );
  }
}