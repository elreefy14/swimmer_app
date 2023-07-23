import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logic/Home/home_cubit.dart';

class ProfileScreen extends StatelessWidget {
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
                  // Navigator.pushNamed(context, editProfileRoute);
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