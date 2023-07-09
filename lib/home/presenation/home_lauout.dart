import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:swimmer_app/home/presenation/widget/widget.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';

import '../../core/cashe_helper.dart';
import '../../registeration/data/user_cache_model.dart';
import '../../registeration/presenation/widget/component.dart';
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
      BottomBarSalomon(
        items: HomeCubit.get(context).items,
        color: Colors.blue,
        backgroundColor: Colors.white,
        colorSelected: Colors.white,
        backgroundSelected: Colors.blue,
        borderRadius: BorderRadius.circular(0),
        indexSelected: HomeCubit.get(context).currentIndex,
        onTap: (index) {
          HomeCubit.get(context).changeBottomNav(index);
        },
      );
  },
),

    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

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

          '${HomeCubit.get(context).userCacheModel!.name}',
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
                //   fontWeight = FontWeight(300),
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
                    //   text = "300 ساعة",
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
                //   fontWeight = FontWeight(300),
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
                    //   text = "300 ساعة",
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
              'فرع الجيزة: القاهرة / الجيزة/ مقابل فلان',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'فرع الجيزة: القاهرة / الجيزة/ مقابل فلان',
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
      ],
    );
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
              '${HomeCubit.get(context).userCacheModel!.name}',
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
                        child: ElevatedButton(
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



class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Four'),
    );
  }
}