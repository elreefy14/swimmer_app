import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/helpers/extensions.dart';
import 'package:swimmer_app/core/routing/routes_manager.dart';
import 'package:swimmer_app/registeration/presenation/widget/welcome_button.dart';
import '../../core/theming/styles.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 45.0.h),
                Image.asset(
                  'assets/images/photo_5814288303556509507_y.jpg', // Replace with your logo asset path
                  height: 250.0.h,
                  width: double.infinity,
                  fit: BoxFit.fitHeight
                ),
                SizedBox(height: 5.0.h),
                Container(

                  //height: 30,
                  alignment: Alignment.center,
                  child:
                  Text(
                    'مرحبا في اكاديمية',
                    style: TextStyles.font24Weight400ColorMyBlack,
                  ),
                ),
                Container(
                  //height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Future Academy',
                    textAlign: TextAlign.center,
                    style:TextStyles.font28Weight600ColorMainBlue,
                   ),
                ),
                SizedBox(height: 10.0.h),
                Image.asset(
                  'assets/images/photo_5814288303556509506_m.jpg', // Replace with your logo asset path
                  height: 50.0.h,
                  width: 45.0.w,
                ),
                SizedBox(height: 30.0.h),

            WelcomeButton(onPressed: () {
             //   Navigator.pushNamed(context, AppRoutes.login);
            context.pushNamed(AppRoutes.login);
            }
            ),
              ],
            ),
          ),
        ));


  }
}

