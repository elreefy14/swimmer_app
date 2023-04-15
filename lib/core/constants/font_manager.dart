import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Text(
//             'Regular text',
//             style: getRegularStyle(fontSize: FontSizeManager.s16, color: Colors.black),
//           ),
//           Text(
//             'Medium text',
//             style: getMediumStyle(fontSize: FontSizeManager.s18, color: Colors.red),
//           ),
//           Text(
//             'Semi-bold text',
//             style: getSemiBoldStyle(fontSize: FontSizeManager.s20, color: Colors.green),
//           ),
//           Text(
//             'Bold text',
//             style: getBoldStyle(fontSize: FontSizeManager.s22, color: Colors.blue),
//           ),
class FontFamilyNames {
  static const String messiriFont = "ElMessiri";
}

class FontWeightManager {
  
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSizeManager {
  static  double s12 = 12.sp;
  static  double s14 = 14.0.sp;
  static  double s16 = 16.0.sp;
  static  double s18 = 18.0.sp;
  static  double s20 = 20.0.sp;
  static  double s22 = 22.0.sp;
  static  double s30 = 30.0.sp;
  static  double s40 = 40.0.sp;
}
