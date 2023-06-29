import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:swimmer_app/home/presenation/widget/widget.dart';

import '../../core/cashe_helper.dart';
import '../../registeration/data/user_cache_model.dart';
import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';
//call
class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return context.watch<HomeCubit>().currentScreen;
        },
      ),
      bottomNavigationBar:
      BottomNavBar()
     //      BottomBarSalomon(
     //
     //                color: Colors.blue,
     //                backgroundColor: Colors.white,
     //                colorSelected: Colors.white,
     //                backgroundSelected: Colors.blue,
     //                borderRadius: BorderRadius.circular(0),
     //                indexSelected: visit,
     //                onTap: (index) => setState(() {
     //                  visit = index;
     //                }),
     //              ),


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

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Two'),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Three'),
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
