import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:swimmer_app/home/business_logic/Home/qr_cubit.dart';
import 'package:swimmer_app/home/presenation/widget/widget.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/cashe_helper.dart';
import '../../main.dart';
import '../../registeration/data/user_cache_model.dart';
import '../../registeration/presenation/widget/component.dart';
import '../../registeration/presenation/widget/widget.dart';
import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';
//call
class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: checkForAppUpdate(
        context,
      ),
      builder: (context, snapshot) {

        return Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return HomeCubit.get(context).currentScreen;
            },
          ),
          bottomNavigationBar: //BottomNavBar(),
          BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
        return
          //  Container(
        //padding:const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        // child: BottomBarFloating(
        //   items: HomeCubit.get(context).items,
        //
        //     color: Colors.blue,
        //     backgroundColor: Colors.white,
        //     colorSelected: Colors.blue,
        //   //  backgroundSelected: Colors.blue,
        //   indexSelected: HomeCubit.get(context).currentIndex,
        // paddingVertical: 24,
        //   onTap: (index) {
        //         HomeCubit.get(context).changeBottomNav(index);
        //       },
        // ),
        // );
          BottomNavBar();
  },
),

        );
      }
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(condition: HomeCubit.get(context).userCacheModel != null,
      builder: (context) => Column(

      children: [
        SizedBox(height:50.0.h),
        Center(
          child: CircleAvatar(
              radius: 50, // adjust the size as needed
              backgroundImage:     NetworkImage(
                HomeCubit.get(context).userCacheModel!.image!,
              )    ),
        ),
        SizedBox(height: 10.0.h),
        Text(

          '${HomeCubit.get(context).userCacheModel!.fname} ${HomeCubit.get(context).userCacheModel!.lname}',
          style: TextStyle(
            fontFamily: 'Montserrat-Arabic',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 16,
            height: 19 / 16,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 8.0.h),
        //Text(
        //   text = "34ج.م / ساعة",
        //   fontSize = 14.sp,
        //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
        //   color = Color(0xFF2196F3),
        //   textAlign = TextAlign.Center,
        //   letterSpacing = 0.1.sp)
        Text(
          '${HomeCubit.get(context).userCacheModel!.hourlyRate}ج.م / ساعة',
          style: TextStyle(
            fontFamily: 'Montserrat-Arabic',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
            height: 19 / 14,
            color: Color(0xFF2196F3),
          ),
        ),
        SizedBox(height: 40.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Container(
            height: 40.h,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EditProfile(),
                //   ),
                // );
                HomeCubit.get(context).changeBottomNav(4);

              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 10.w),
                  ImageIcon(
                    AssetImage('assets/images/Month Chevron.png'),
                    size: 40,
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //Text(
                      //   text = "معلومات حسابك",
                      //   fontSize = 13.sp,
                      //   fontFamily = FontFamily(Font(R.font.dm sans),
                      //   fontWeight = FontWeight(500),
                      //   color = Color(0xFF181D27),
                      //   textAlign = TextAlign.Right)
                      Text(
                        'معلومات حسابك',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          height: 19 / 13,
                          color: Color(0xFF181D27),
                        ),
                      ),
                      //Text(
                      //   text = "الاسم, الرقم...",
                      //   fontSize = 11.sp,
                      //   fontFamily = FontFamily(Font(R.font.dm sans),
                      //   color = Color(0xFFABABAB),
                      //   textAlign = TextAlign.Right)
                      Text(
                        'الاسم, الرقم...',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          height: 19 / 11,
                          color: Color(0xFFABABAB),
                        ),
                      ),
                    ],
                  ),
                  //image.asset
                  // Image.asset(
                  //   'assets/images/Profile.png',
                  //   width: 40.w,
                  //   height: 40.h,
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(width: 20.w),
                  ImageIcon(
                    AssetImage('assets/images/Profile.png'),
                    size: 40,

                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0.h),
        //Text(
        //   text = "مرتبك",
        //   fontSize = 18.sp,
        //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
        //   textAlign = TextAlign.Right)
        Padding(
          padding: EdgeInsets.only(
            right: 30.w,),
          child: Row(

            children: [
              Spacer(),
              Text(
                'مرتبك',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  height: 19 / 18,
                  color: Color(0xFF181D27),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0.h),
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child:
          Container(
            height: 170.h,
            margin: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 10.h,
            ),
            color: Colors.white,
            child: Column(
              children: [
                //Text(
                //   text = "جميع الايام",
                //   fontSize = 14.sp,
                //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                //   fontWeight = FontWeight(250),
                //   color = Color(0xFF333333),
                //   textAlign = TextAlign.Right)
                Text(
                  'جميع الايام',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    height: 19 / 14,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(
                    //   text = "مجموع الراتب",
                    //   fontSize = 11.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   fontWeight = FontWeight(500),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Right)
                    Text(
                      'مجموع الراتب',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        height: 19 / 11,
                        color: Color(0xFF333333),
                      ),
                    ),
                    //Text(
                    //   text = "مجموع الساعات",
                    //   fontSize = 11.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   fontWeight = FontWeight(500),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Right)
                    Text(
                      'مجموع الساعات',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        height: 19 / 11,
                        color: Color(0xFF333333),
                      ),
                    ),


                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(
                    //   text = " 10,200 ج.م",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF2196F3),
                    //   textAlign = TextAlign.Right)
                    Text(
                      HomeCubit.get(context).userCacheModel!.totalSalary.toString() + 'ج.م',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 19 / 12,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    //Text(
                    //   text = "250 ساعة",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF2196F3),
                    //   textAlign = TextAlign.Right)
                    Text(
                      HomeCubit.get(context).userCacheModel!.totalHours.toString() + 'ساعة',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 19 / 12,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ],
                ),
                //Text(
                //   text = "هذا الشهر",
                //   fontSize = 14.sp,
                //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                //   fontWeight = FontWeight(250),
                //   color = Color(0xFF333333),
                //   textAlign = TextAlign.Right)
                SizedBox(height: 15.h),
                Text(
                  'هذا الشهر',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    height: 19 / 14,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(
                    //   text = "مجموع الراتب",
                    //   fontSize = 11.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   fontWeight = FontWeight(500),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Right)
                    Text(
                      'مجموع الراتب',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        height: 19 / 11,
                        color: Color(0xFF333333),
                      ),
                    ),
                    //Text(
                    //   text = "مجموع الساعات",
                    //   fontSize = 11.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   fontWeight = FontWeight(500),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Right)
                    Text(
                      'مجموع الساعات',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        height: 19 / 11,
                        color: Color(0xFF333333),
                      ),
                    ),


                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(
                    //   text = " 10,200 ج.م",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF2196F3),
                    //   textAlign = TextAlign.Right)
                    Text(
                      HomeCubit.get(context).userCacheModel?.currentMonthSalary.toString()??'' + ' ج.م',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 19 / 12,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    //Text(
                    //   text = "250 ساعة",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF2196F3),
                    //   textAlign = TextAlign.Right)
                    Text(
                      HomeCubit.get(context).userCacheModel?.currentMonthHours.toString()??'' + ' ساعة',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 19 / 12,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 30.w,),
          child: Row(

            children: [
              Spacer(),
              Text(
                'فروعك',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  height: 19 / 18,
                  color: Color(0xFF181D27),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        //Text(
        //   text = "فرع الجيزة: القاهرة / الجيزة/ مقابل فلان",
        //   fontSize = 11.sp,
        //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
        //   color = Color(0xFF333333),
        //   textAlign = TextAlign.Right)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              HomeCubit.get(context).userCacheModel!.branches.toString().replaceAll('[', '').replaceAll(']', ''),
              style: TextStyle(
                fontFamily: 'Montserrat-Arabic',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                height: 19 / 11,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(width: 30.w),

          ],
        ),
        SizedBox(height: 7.h),
      ],
    ),
        fallback: (context) => Center(child: CircularProgressIndicator(),),);
  }
}



class EditProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HomeCubit.get(context).initControllers();
        return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
        // TODO: implement listener
  },
  builder: (context, state) {
        return Column(
          children: [
            SizedBox(height:30.0.h),
            Center(
              child: CircleAvatar(
                radius: 50, // adjust the size as needed
                backgroundImage: //networkImage
                NetworkImage(
                  HomeCubit.get(context).userCacheModel!.image!,
                )
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              '${HomeCubit.get(context).userCacheModel!.fname!} ${HomeCubit.get(context).userCacheModel!.lname!}',
              style: TextStyle(
                fontFamily: 'Montserrat-Arabic',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                fontSize: 16,
                height: 19 / 16,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 8.0.h),

            Text(
              '34ج.م / ساعة',
              style: TextStyle(
                fontFamily: 'Montserrat-Arabic',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
                height: 19 / 14,
                color: Color(0xFF2196F3),
              ),
            ),
          //15.h
            SizedBox(height: 15.0.h),
          InkWell(
            onTap: () {
               HomeCubit.get(context).getProfileImage();
            },
            child: Container(
              decoration: BoxDecoration(
                      color: Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(15.0.r),
                      border: Border.all(
                        color: Color(0xFF2196F3),
                        width: 1.0.w,
                      ),
                    ),

                    width: 180.0.w,
                    height: 50.0.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w,
                        vertical: 9.0.h,
                      ),
                      child:
                      Center(
                        child: Text(
                          'تعديل الصورة',
                          style: TextStyle(
                            fontFamily: 'Montserrat-Arabic',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: 18.sp,
                            height: 21 / 18,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
            //35
            SizedBox(height: 35.0.h),

            Form(
              key: HomeCubit.get(context).formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                    child: BuildTextFormField('الاسم الاول',
        HomeCubit.get(context).firstNameController
        ,TextInputType.name, 'ادخل الاسم الاول', (value) {
                      if (value!.isEmpty) {
                        return ' الرجاء ادخال الاسم الاول';
                      }
                      return null;
                    },'assets/images/Vector.png' ,null),
                  ),
                  SizedBox(height: 15.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                    child: BuildTextFormField('الاسم الاخير', HomeCubit.get(context).lastNameController
                        , TextInputType.name,'ادخل الاسم الاخير', (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء ادخال الاسم الاخير';
                      }
                      return null;
                    },'assets/images/Vector.png',null),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                    child: BuildTextFormField('رقم الهاتف',HomeCubit.get(context).phoneController,
                        TextInputType.phone,'ادخل رقم الهاتف', (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء ادخال رقم الهاتف';
                      }
                      return null;
                    },'assets/images/Vector.png',null),
                  ),
                  SizedBox(height: 15.0.h),

                  // BlocConsumer<OtpCubit,OtpState >(
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 31.w,
                            right: 31.w,
                            top: 20.h
                        ),
                        child: ConditionalBuilder(
                            builder: (context) =>  ElevatedButton(
                              onPressed: () {
                                if (HomeCubit.get(context).formKey.currentState!.validate()) {
                                  HomeCubit.get(context).editUserData(
                                    firstName: HomeCubit.get(context).firstNameController.text,
                                    lastName: HomeCubit.get(context).lastNameController.text,
                                    phone: HomeCubit.get(context).phoneController.text,
                                  );
                                }
                              },
                              child: Text(
                                'حفظ التعديلات',
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
                            fallback: (context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          condition: state is! EditUserDataLoadingState,
                        ),

                      );

                    },
                    fallback: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),

          ],
        );
  },
);
      }
    );
  }
}


//
// class ScreenFour extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Column(
//           children: [
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Image.asset(
//                               "assets/Vector.png",
//                               width: 8,
//                               height: 9,
//                             ),
//                             Image.asset(
//                               "assets/Vector.png",
//                               width: 5,
//                               height: 16,
//                             ),
//                             Image.asset(
//                               "assets/Vector.png",
//                               width: 8,
//                               height: 4,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                             "لوحة التحكم",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             )
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Image.asset(
//                                   "assets/Vector.png",
//                                   width: 24,
//                                   height: 24,
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         Text(
//                             "امسح QR",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             )
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Image.asset(
//                                   "assets/Vector.png",
//                                   width: 24,
//                                   height: 24,
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         Text(
//                             "الملف الشخصي",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             )
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset(
//                               "assets/Vector.png",
//                               width: 20,
//                               height: 24.444576263427734,
//                             )
//                           ],
//                         ),
//                         Text(
//                             "الاشعارات",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             )
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//         Column(
//           children: [
//             Column(
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                         "جار البحث عن رمز QR...",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w300,
//                         )
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                                 width: 30,
//                                 height: 30,
//                                 decoration:     BoxDecoration()
//                             ),
//                             Container(
//                                 width: 30.000003814697266,
//                                 height: 30.000003814697266,
//                                 decoration:     BoxDecoration()
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                                 width: 30,
//                                 height: 30,
//                                 decoration:     BoxDecoration()
//                             ),
//                             Container(
//                                 width: 30.000003814697266,
//                                 height: 30.000003814697266,
//                                 decoration:     BoxDecoration()
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                         "تعليمات",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         )
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                         "- تأكد ان رمز QR يظهر بوضوح.",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         )
//                     ),
//                     Text(
//                         "- اقترب من رمز  QR",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         )
//                     ),
//                     Text(
//                         "- تأكد من ان المكان ليس معتم.",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         )
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         )
//       ],
//     );
//   }
// }


class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        QrCubit.get(context).qrCodeScanned =false;
        return Scaffold(
          //make screen to scan qr code using camera and pr

          body: Column(
            children: [
              SizedBox(
                height: 160.h,
              ),
            BlocConsumer<QrCubit, QrState>(
  listener: (context, state) {

  },
  builder: (context, state) {
        //class QrCodeScannedSuccessfully extends QrState {
        // }
        // //QrError
        // class QrError extends QrState {
        //   final String message;
        //
        //   QrError(this.message);
        // }
        // //qrCodeScannedSuccessfully
        // class QrCodeScannedSuccessfullyWithNoInternet extends QrState {
        // }
        return state is QrLoading
            ?    Text(
          ' جار التعرف على رمز QR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontFamily: 'Montserrat-Arabic',
            fontWeight: FontWeight.w300,
            //    height: 26,
          ),
        )
            : state is QrCodeScannedSuccessfully ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'تم',
                style: TextStyle(
                  color: Color(0xFF00CE39),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
               //   height:
                ),
              ),
              TextSpan(
                text: ' تسجيل حضورك',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                 // height: 26,
                ),
              ),
            ],
          ),
        ) : state is QrError ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'فشل',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  //   height:
                ),
              ),
              TextSpan(
                text: '  التعرف على رمز QR...',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  // height: 26,
                ),
              ),
            ],
          ),
        ) : state is QrCodeScannedSuccessfullyWithNoInternet ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'تم',
                style: TextStyle(
                  color: Color(0xFF00CE39),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  height: 26,
                ),
              ),
              TextSpan(
                text: ' تسجيل حضورك',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  height: 26,
                ),
              ),
            ],
          ),
        ): Text(
          'جار البحث عن رمز QR...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontFamily: 'Montserrat-Arabic',
            fontWeight: FontWeight.w300,
            //    height: 26,
          ),
        );

  },
),
              SizedBox(
                height: 5.h
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 250.h,
                      width: 250.w,
                      child: BlocBuilder<QrCubit, QrState>(
  builder: (context, state) {
        return MobileScanner(onDetect: (BarcodeCapture barcodes) {
          if(QrCubit.get(context).qrCodeScanned == true) {
           // showToast(
            //  msg: "A QR code has already been scanned.",
            //  state: ToastStates.ERROR,
           // );
            return;}else{
            String? displayValue = barcodes.barcodes[0].displayValue;
            QrCubit.get(context).onQRCodeScanned(
                hourlyRate: HomeCubit
                    .get(context)
                    .userCacheModel!
                    .hourlyRate ?? 0,
                coachId: HomeCubit
                    .get(context)
                    .userCacheModel!
                    .uId ?? '',
                scheduleId: displayValue.toString()).then((value) =>
                HomeCubit.get(context).getUserData());
                 QrCubit.get(context).qrCodeScanned =true;
          //  HomeCubit.get(context).changeBottomNav(0);
          }
        },
                      fit: BoxFit.cover,
                      );
  },
),
                    ),
                  ),
                Center(
                  child: Container(
                    height: 250.h,
                    width: 250.w,
                    child: const QrScannerOverlay(
                        borderColor: Colors.blue,
                      ),
                  ),
                ),
                ],
                ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            "تعليمات",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w400,
                           // height: 16.80,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                          "- تأكد ان رمز QR يظهر بوضوح.",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                         // height: 18,
                        ),
                      ),
                      Text(
                          "- اقترب من رمز  QR",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                        //  height: 18,
                        ),
                      ),
                      Text(
                          "- تأكد من ان المكان ليس معتم.",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                      //    height: 18,
                        ),
                      )
                    ],
                  )
                ],
              )
                ],
          ),
        );
      }
    );
  }
}


class QrScannerOverlay extends StatelessWidget {
  final Color borderColor;

  const QrScannerOverlay({Key? key, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QrScannerOverlayPainter(borderColor),
    );
  }
}

class _QrScannerOverlayPainter extends CustomPainter {
  final Color borderColor;

  _QrScannerOverlayPainter(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final scanAreaWidth = size.width * 0.7;
    final scanAreaHeight = size.height * 0.5;
    final scanAreaRect = Rect.fromCenter(
      center: rect.center,
      width: scanAreaWidth,
      height: scanAreaHeight,
    );

    final borderPath = Path()
      ..addRect(rect);
    //..addRect(scanAreaRect);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(_QrScannerOverlayPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor;
  }
}
Future checkForAppUpdate(context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  print('packageInfo \n\n\n\n\n\n\n ${packageInfo.version}');
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 60  ),
      minimumFetchInterval: Duration(seconds: 1)
  ));
  await remoteConfig.fetchAndActivate();

  bool forceUpdate = //if packageInfo.version is less than the version in firebase
  //
  remoteConfig.getString('app_version').compareTo(packageInfo.version) > 0;
  String appVersion = remoteConfig.getString('app_version');
  print('force_update \n\n\n\n\n\n\n $forceUpdate');
  print('app_version \n\n\n\n\n\n\n $appVersion');
  if (forceUpdate) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text("Update Available"),
              content: Text("A new version of the app is available."),
              actions: [
                TextButton(
                    child: Text("Update"),
                    onPressed: () {
                      //url_launcher to https://play.google.com/store/apps/details?id=kaleo.chat.app

                      final Uri _url = Uri.parse('https://play.google.com/store/apps/details?id=kaleo.chat.app');
                      launchUrl(_url);
                    }
                ),
                // TextButton(
                //     child: Text("Cancel"),
                //     onPressed: () { Navigator.pop(context); }
                // )
              ]
          );
        }
    );
  }
}