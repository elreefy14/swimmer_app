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
            backgroundImage: AssetImage('assets/images/Ellipse 1.jpg'), // replace with your image path
          ),
        ),
        SizedBox(height: 10.0.h),
        Text(
          ' ahmed',
         // '${HomeCubit.get(context).userCacheModel!.name}',
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
            //Modifier
          //   .offset(x = 0.dp, y = 31.dp)
          //   .border(width = 2.dp, color = Color(0xFF2196F3), shape = RoundedCornerShape(size = 4.dp)))
          //   .width(332.dp)
          //   .height(185.dp)
          //   .padding(start = 50.dp, top = 10.dp, end = 50.dp, bottom = 10.dp)
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
                      ' 10,200 ج.م',
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
                      '300 ساعة',
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
                      ' 10,200 ج.م',
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
                      '300 ساعة',
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

class ScreenOne extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      builder: (context) =>  Column(
        children: [
          //container with height 100
          Container(
            height: 230.h,
            width: double.infinity,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/Dashboard Card.png'),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 17.0.h),
                CircleAvatar(
                  radius: 50, // adjust the size as needed
                  backgroundImage: AssetImage('assets/images/Ellipse 1.jpg'), // replace with your image path
                ),
                SizedBox(height: 2.0.h),
                Text(
                  // 'مرحباً',
                  '${HomeCubit.get(context).userCacheModel!.name}',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    height: 19 / 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: 16.0.h),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اقرب موعد',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(width: 5.0.w),
                      Text(
                        '4/ 24 - 11 AM',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.0.h),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //Text(
                        //   text = "السعر / الساعة",
                        //   fontSize = 12.sp,
                        //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                        //   color = Color(0xFFFFFFFF),
                        //   textAlign = TextAlign.Right)
                        'السعر / الساعة ',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(width: 5.0.w),
                      Text(
                        '4/ 24 - 11 AM',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.0.h),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الفروع',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(width: 5.0.w),
                      Text(
                        '4/ 24 - 11 AM',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0.h),



              ],
            ),
          ),
          SizedBox(height: 15.0.h),
          Text(
            'هذا الشهر',
            style: TextStyle(
              fontFamily: 'Montserrat-Arabic',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontSize: 18,
              height: 21 / 18,
              color: Color(0xFF333333),
            ),
          ),
          SizedBox(height: 10.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.0.w,
                height: 40.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(12.0.r),
                ),
                child: Center(
                  child:
                  //Text(
                  //   text = "680 ج.م",
                  //   fontSize = 14.sp,
                  //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                  //   color = Color(0xFFFFFFFF),
                  //   textAlign = TextAlign.Center)
                  Text(
                    HomeCubit.get(context).userCacheModel!.totalSalary.toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat-Arabic',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 16 / 14,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),

                ),
              ),
              //w 10
              SizedBox(width: 10.0.w),
              Container(
                width: 100.0.w,
                height: 40.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(12.0.r),
                ),
                child: Center(
                  child:
                  //Text(
                  //   text = "680 ج.م",
                  //   fontSize = 14.sp,
                  //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                  //   color = Color(0xFFFFFFFF),
                  //   textAlign = TextAlign.Center)
                  Text(
                    HomeCubit.get(context).userCacheModel!.totalHours.toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat-Arabic',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 16 / 14,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),

                ),
              ),
            ],
          ),
          //10 h
          SizedBox(height: 10.0.h),
          //Modifier
          //   .offset(x = 8.dp, y = 11.dp)
          //   .width(63.dp)
          //   .height(59.dp)
          Container(
            width: 80.0.w,
            height: 80.0.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF2196F3),
                width: 2.0.w,
              ),
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //The element type 'AssetImage' can't be assigned to the list type 'Widget'.
                Image( image:   AssetImage('assets/images/scan-qrcode_svgrepo.com.jpg'),),
                Text(
                  'امسح QR',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 16 / 14,
                    color: Color(0xFF333333),
                  ),
                ),

              ],
            ),
          ),
          //15 h
          SizedBox(height: 15.0.h),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text(
                  'ساعات العمل',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 19 / 16,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5.0.h),
          //Modifier
          //   .offset(x = 5.dp, y = 5.dp)
          //   .border(width = 1.dp, color = Color(0xFF2196F3), shape = RoundedCornerShape(size = 4.dp)))
          //   .padding(1.dp)
          //   .width(310.dp)
          //   .height(20.dp)
          //   .background(color = Color(0xFFFFFFFF), shape = RoundedCornerShape(size = 4.dp))
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
              ),
              ////ListView.builder(
              // //   itemCount: userSchedules.length,
              // //   itemBuilder: (context, index) {
              // //     var schedule = userSchedules[index];
              // //     var startTime = DateFormat('hh a', 'ar').format(schedule.startTime.toDate());
              // //     var date = DateFormat('yyyy/MM/dd EEEE', 'ar').format(schedule.date.toDate());
              // //     var formattedSchedule = '$startTime $date';
              // //
              // //     return Text(formattedSchedule);
              // //   },
              // // ),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
                //   physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context, index) {
                  if(state is LoadingState)
                    return Center(child: CircularProgressIndicator());
                  else if(state is GetAllSchedulesForSpecificCoachSuccessState)
                    {
                      var schedule = state.schedules[index];
                      var startTime =
                      DateFormat('hh a', 'ar').format(schedule.startTime?.toDate()??DateTime.now());
                      var date = DateFormat('yyyy/MM/dd ', 'ar').format(schedule.date?.toDate()??DateTime.now());
                      var day = DateFormat('EEEE', 'ar').format(schedule.date?.toDate()??DateTime.now());
                      var formattedSchedule = '$startTime $date';
                      return Container(
                  width: 310.0.w,
                  height: 20.0.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(4.0.r),
                    border: Border.all(
                      color: Color(0xFF2196F3),
                      width: 1.0.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        day,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFF333333),
                        ),
                      ),
                      //Text(
                      //   text = "2023/04/23",
                      //   fontSize = 12.sp,
                      //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                      //   color = Color(0xFF333333),
                      //   textAlign = TextAlign.Right)
                      Text(
                        date,

                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFF333333),
                        ),
                      ),
                      //Text(
                      //   text = "10 AM",
                      //   fontSize = 12.sp,
                      //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                      //   color = Color(0xFF333333),
                      //   textAlign = TextAlign.Center)
                      Text(
                        startTime,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 14 / 12,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                );
                    }
                  else
                    return Center(child: Text('Error'));
                },
                itemCount: state is GetAllSchedulesForSpecificCoachSuccessState?state.schedules.length:0,

              ),
            ),
          ),


        ],
      ),
      condition: HomeCubit.get(context).userCacheModel != null && state is GetAllSchedulesForSpecificCoachSuccessState,
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),

    );
  },
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
                    },'assets/images/Vector.png' ),
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
                    },'assets/images/Vector.png'),
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
                    },'assets/images/Vector.png'),
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