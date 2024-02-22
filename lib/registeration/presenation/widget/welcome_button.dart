import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/my_color.dart';
import '../../../core/theming/styles.dart';

class WelcomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  WelcomeButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 31.w,
        right: 31.w,
      ),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'تسجيل دخول',
            style: TextStyles.font18Weight400ColorWhite,
            textAlign: TextAlign.center,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.mainBlue, // Background color
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
    );
  }
}