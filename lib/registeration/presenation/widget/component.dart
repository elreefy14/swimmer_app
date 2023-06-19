import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget BuildTextFormField(
    String labelText,
    TextEditingController controller,
    TextInputType input,
    String hintText,
    String? Function(String?) validator,
    IconData? icon,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF333333),
          fontFamily: 'IBM Plex Sans Arabic',
         // fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.right,
      ),
      SizedBox(height: 8.h),
      TextFormField(
        controller: controller,
        keyboardType: input,
        obscureText: labelText == 'كلمة المرور' ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            height: 24.0 / 16.0,
            color: Color(0xFF666666),
          ),
          filled: true,
          fillColor: Color(0xFFF4F4F4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Color(0xFF2196F3), width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        validator: validator,
      ),
    ],
  );
}

