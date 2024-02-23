import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';
import 'my_color.dart';

class TextStyles {
  //TextStyle(
  //                           fontFamily: 'Montserrat-Arabic',
  //                           fontStyle: FontStyle.normal,
  //                           fontWeight: FontWeight.w300,
  //                           fontSize: 14,
  //                           height: 16 / 14,
  //                           color: Color(0xFFFFFFFF),
  //                         ),
  static TextStyle font15Weight300ColorWhite =
      TextStyle(
    fontFamily: 'Montserrat-Arabic',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    height: 16.h / 14.h,
    color: ColorsManager.white,
  );
  //// TextStyle(
  //                                           //   color: Color(0xFF333333),
  //                                           //   fontSize: 12,
  //                                           //   fontFamily:
  //                                           //   'IBM Plex Sans Arabic',
  //                                           //   fontWeight: FontWeight.w300,
  //                                           // ),
  static TextStyle font12Weight300ColorMyBlack =
      TextStyle(
    fontSize: 14.sp,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w300,
    color: ColorsManager.myBlack,
    //color: ColorsManager.darkBlue,
  );
  // // TextStyle(
  //                               //         color: Color(0xFF333333),
  //                               //         fontSize: 20,
  //                               //         fontFamily: 'Montserrat-Arabic',
  //                               //         fontWeight: FontWeight.w300,
  //                               //       ),
  static TextStyle font20Weight300ColorDarkBlue =
      TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.light,
    //color: ColorsManager.darkBlue,
  );

 //TextStyle(
  //               color: Color(0xFF333333),
  //               fontSize: 24,
  //               fontFamily: 'Montserrat-Arabic',
  //               fontWeight: FontWeight.w400,
  //               height: 0.04,
  //             ),

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
  //  color: ColorsManager.darkBlue,
  );
  //make this text style as a static method
  //Text(
  //                     'مرحبا في اكاديمية',
  //                     style: TextStyle(
  //                       fontFamily: 'Montserrat-Arabic',
  //                       fontStyle: FontStyle.normal,
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 24,
  //                       height: 29 / 24,
  //                       color: Color(0xFF333333),
  //                     ),
  //                   ),
  static TextStyle font24Weight400ColorMyBlack=
      TextStyle(
    fontFamily: 'Montserrat-Arabic',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
    height: 29.h / 24.h,
    color: ColorsManager.myBlack,
  );
  //Text(
//                     'Future Academy',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'IBM Plex Sans Devanagari',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 24,
//                       height: 37 / 24,
//                       color: Color(0xFF2196F3),
//                     ),
//                   ),
  static TextStyle font28Weight600ColorMainBlue=
      TextStyle(
    fontFamily: 'IBM Plex Sans Devanagari',
    fontWeight: FontWeight.w600,
    fontSize: 28.sp,
    height: 37.h / 24.h,
    color: ColorsManager.mainBlue,
  );
  //    TextStyle(
//                       fontFamily: 'Montserrat-Arabic',
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 18,
//                       height: 26 / 18,
//                       color: Color(0xFFFFFFFF),
//                     ),
  static TextStyle font18Weight400ColorWhite=
      TextStyle(
    fontFamily: 'Montserrat-Arabic',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    height: 26.h / 18.h,
    color: ColorsManager.white,
  );
  //TextStyle(


}
