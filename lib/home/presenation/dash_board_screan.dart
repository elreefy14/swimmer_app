import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:swimmer_app/home/business_logic/Home/qr_cubit.dart';

import '../business_logic/Home/dash_board_cubit.dart';
import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';
import '../data/schedules.dart';

class DashBoard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

        return  ConditionalBuilder(
          builder: (context) =>  Column(
            children: [
              //container with height 100
              Container(
                height: 270.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      //Dashboard Card.png
                      image: AssetImage('assets/images/Dashboard Card.png'),
                      fit: BoxFit.cover,
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 17.0.h),
                    CircleAvatar(
                      radius: 50, // adjust the size as needed
                      backgroundImage:
                      AssetImage('assets/images/empty-profile.png'),
                    ),
                    SizedBox(height: 2.0.h),
                    BlocBuilder<DashBoardCubit, DashBoardState>(
  builder: (context, state) {
    return Text(
                      // 'مرحباً',
                    //  '${HomeCubit.get(context).userCacheModel!.fname} ${HomeCubit.get(context).userCacheModel!.lname}',
                      '${DashBoardCubit.get(context).coach?.name} ',
                         // '${DashBoardCubit.get(context).coach?.lname}',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        height: 19 / 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    );
  },
),

                    SizedBox(height: 5.0.h),
                    // Padding(
                    //   padding:  EdgeInsets.symmetric(
                    //     horizontal: 20.0.w,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         //Text(
                    //         //   text = "السعر / الساعة",
                    //         //   fontSize = 12.sp,
                    //         //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //         //   color = Color(0xFFFFFFFF),
                    //         //   textAlign = TextAlign.Right)
                    //         'السعر / الساعة ',
                    //         style: TextStyle(
                    //           fontFamily: 'IBM Plex Sans Arabic',
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 12,
                    //           height: 14 / 12,
                    //           color: Color(0xFFFFFFFF),
                    //         ),
                    //       ),
                    //       SizedBox(width: 5.0.w),
                    //       Text(
                    //         HomeCubit.get(context).userCacheModel!.hourlyRate.toString() + ' ج.م',
                    //         style: TextStyle(
                    //           fontFamily: 'Montserrat-Arabic',
                    //           fontStyle: FontStyle.normal,
                    //           fontWeight: FontWeight.w300,
                    //           fontSize: 12,
                    //           height: 14 / 12,
                    //           color: Color(0xFFFFFFFF),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 35.0.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<DashBoardCubit, DashBoardState>(
                            builder: (context, state) {
                              return Text(
                                //   state is LoadingState
                                //   ?
                                // 'جاري التحميل'
                                //       : state is GetAllSchedulesForSpecificCoachSuccessState && state.schedules.length > 0 ?
                                // //  '${DateFormat('yyyy-MM-dd').format(state.schedules[0].startTime!.toDate())} ${DateFormat('hh:mm a').format(state.schedules[0].startTime!.toDate())}': 'لا يوجد مواعيد',
                                //  HomeCubit.get(context).firstDateInSharedPreferences == null ? 'لا يوجد مواعيد' : '${DateFormat('yyyy-MM-dd').format(HomeCubit().firstDateInSharedPreferences!)} ${DateFormat('hh:mm a').format(HomeCubit().firstDateInSharedPreferences!)}'
                                // DashBoardCubit.get(context).firstSchedule == null ? 'لا يوجد مواعيد' : '${DateFormat('yyyy-MM-dd').format(DashBoardCubit.get(context).firstSchedule!.startTime!)} ${DateFormat('hh:mm a').format(DashBoardCubit.get(context).firstSchedule!.startTime!)}'
                                DashBoardCubit.get(context).firstSchedule == null
                                    ? 'لا يوجد مواعيد'
                                    : '${DateFormat('yyyy-MM-dd').format(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate())} ${DateFormat('hh:mm a').format(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate())}'
                                ,style: TextStyle(
                                fontFamily: 'Montserrat-Arabic',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 14 / 12,
                                color: Color(0xFFFFFFFF),
                              ),
                              );
                            },
                          ),

                          SizedBox(width: 5.0.w),
                          Text(
                            //nearest date today
                            'اقرب موعد'
                                //today
                                'اليوم',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              height: 14 / 12,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
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
                          BlocBuilder<DashBoardCubit, DashBoardState>(
                            builder: (context, state) {
                              return state is GetUserDataSuccessState ?
                              Text(
                                //HomeCubit.get(context).userCacheModel!.hourlyRate.toString() + ' ج.م',
                                DashBoardCubit.get(context).coach?.hourlyRate.toString()??'' ,//+ ' ج.م',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Arabic',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  height: 14 / 12,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ) : Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(width: 5.0.w),
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

                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),



                  ],
                ),
              ),
              SizedBox(height: 20.0.h),
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
              SizedBox(height: 15.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110.0.w,
                    height: 50.0.h,
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
                      BlocBuilder<DashBoardCubit, DashBoardState>(
  builder: (context, state) {
    return Text(
                        //HomeCubit.get(context).userCacheModel!.totalSalary.toString() + ' ج.م',
                        DashBoardCubit.get(context).coach?.totalSalary.toString()??'' + ' ج.م',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          height: 16 / 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      );
  },
),

                    ),
                  ),
                  //w 10
                  SizedBox(width: 15.0.w),
                  Container(
                    width: 110.0.w,
                    height: 50.0.h,
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
                      BlocBuilder<DashBoardCubit, DashBoardState>(
  builder: (context, state) {
    return Text(
                        DashBoardCubit.get(context).coach!.totalHours.toString()
                            +
                            ' ساعة',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Arabic',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          height: 16 / 14,
                          color: Color(0xFFFFFFFF),
                        ),
                      );
  },
),

                    ),
                  ),
                ],
              ),
              //10 h
              SizedBox(height: 20.0.h),
              //Modifier
              //   .offset(x = 8.dp, y = 11.dp)
              //   .width(63.dp)
              //   .height(59.dp)
              InkWell(
                onTap: () {
                  HomeCubit.get(context).changeBottomNav(1);
                },
                child: Container(
                  width: 90.0.w,
                  height: 90.0.h,
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
              ),
              //15 h
              SizedBox(height: 20.0.h),
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
                  child:
                  //i want to get the first 1 in global variable
                  FirestoreListView(
                    query: FirebaseFirestore.instance.
                    collection('users').
                    doc(FirebaseAuth.instance.currentUser!.uid).
                    collection('schedules')
                        .orderBy('start_time_hour', descending: true),
                    itemBuilder: (BuildContext context, DocumentSnapshot documentSnapshot) {
                      initializeDateFormatting();
                      var schedule = documentSnapshot.data() as Map<String, dynamic>;

                      var startTime = DateFormat('hh a', 'ar').format(schedule['start_time'].toDate());
                      var date = DateFormat('yyyy/MM/dd', 'ar').format(schedule['start_time'].toDate());
                      var day = DateFormat('EEEE', 'ar').format(schedule['start_time'].toDate());
                      // Get current day and time
//                       var currentDay = DateFormat('EEEE', 'ar').format(DateTime.now());
//                       var currentTime = DateFormat('hh a', 'ar').format(DateTime.now());
//
// // Check if the schedule is for today and its start time is after the current time
//                       if (DashBoardCubit.get(context).firstSchedule == null &&
//                           day == currentDay &&
//                           DateTime.parse(startTime).isAfter(DateTime.parse(currentTime))) {
//                         DashBoardCubit.get(context).firstSchedule = SchedulesModel.fromJson2(schedule);
//                       }
                      var formattedSchedule = '$startTime $date';
                      return Column(
                        children: [
                          Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

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
                              ],
                            ),
                          ),
                          //15
                          SizedBox(height: 12.0.h),
                        ],
                      );
                    },
                    cacheExtent: 100,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    pageSize: 30,
                    emptyBuilder: (BuildContext context) {
                      return Center(child: Text('No Data'));
                    },

                  ),
                  // ConditionalBuilder(
                  //
                  //    condition: HomeCubit.get(context).schedulesList?.length == 0,
                  //   builder: (context) =>  Center(child: Text('No Data')),
                  //   fallback: (context) =>
                  //       ListView.separated(
                  //     separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
                  //     //   physics: NeverScrollableScrollPhysics(),
                  //     itemBuilder:(context, index) {
                  //       if(state is LoadingState)
                  //         return Center(child: CircularProgressIndicator());
                  //       else if(HomeCubit.get(context).schedulesList !=0)
                  //       {
                  //         var schedule = HomeCubit.get(context).schedulesList![index];
                  //         var startTime =
                  //         DateFormat('hh a', 'ar').format(schedule.startTime?.toDate()??DateTime.now());
                  //         var date = DateFormat('yyyy/MM/dd ', 'ar').format(schedule.startTime?.toDate()??DateTime.now());
                  //         var day = DateFormat('EEEE', 'ar').format(schedule.startTime?.toDate()??DateTime.now());
                  //         var formattedSchedule = '$startTime $date';
                  //         return Container(
                  //           width: 310.0.w,
                  //           height: 20.0.h,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFFFFFFF),
                  //             borderRadius: BorderRadius.circular(4.0.r),
                  //             border: Border.all(
                  //               color: Color(0xFF2196F3),
                  //               width: 1.0.w,
                  //             ),
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Text(
                  //                 day,
                  //                 style: TextStyle(
                  //                   fontFamily: 'IBM Plex Sans Arabic',
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 12,
                  //                   height: 14 / 12,
                  //                   color: Color(0xFF333333),
                  //                 ),
                  //               ),
                  //               //Text(
                  //               //   text = "2023/04/23",
                  //               //   fontSize = 12.sp,
                  //               //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                  //               //   color = Color(0xFF333333),
                  //               //   textAlign = TextAlign.Right)
                  //               Text(
                  //                 date,
                  //
                  //                 style: TextStyle(
                  //                   fontFamily: 'IBM Plex Sans Arabic',
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 12,
                  //                   height: 14 / 12,
                  //                   color: Color(0xFF333333),
                  //                 ),
                  //               ),
                  //               //Text(
                  //               //   text = "10 AM",
                  //               //   fontSize = 12.sp,
                  //               //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                  //               //   color = Color(0xFF333333),
                  //               //   textAlign = TextAlign.Center)
                  //               Text(
                  //                 startTime,
                  //                 style: TextStyle(
                  //                   fontFamily: 'IBM Plex Sans Arabic',
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 12,
                  //                   height: 14 / 12,
                  //                   color: Color(0xFF333333),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }
                  //       else
                  //         return Center(child: Text('Error'));
                  //     },
                  //     itemCount: HomeCubit.get(context).schedulesList?.length??0,
                  //
                  //   ),
                  // ),
                ),
              ),


            ],
          ),
          condition:
              //zbt no wifi from here
            //  true,
          DashBoardCubit.get(context).coach != null || DashBoardCubit.get(context).isCoachfull,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),

        );
          }

  }
