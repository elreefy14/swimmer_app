import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/home/presenation/widget/schedule_list.dart';
import 'package:swimmer_app/home/presenation/widget/user_card_info.dart';
import '../business_logic/Home/dash_board_cubit.dart';

class DashBoardScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

        return  BlocBuilder<DashBoardCubit, DashBoardState>(
  builder: (context, state) {
    return ConditionalBuilder(
          builder: (context) =>  Column(
            children: [
              //container with height 100
              UserCardInfo(),
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
                      Text(
                        //HomeCubit.get(context).userCacheModel!.totalSalary.toString() + ' ج.م',
                        DashBoardCubit.get(context).coach!.totalSalary.toString()
                            + ' ج',
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
                      //   te\\xt = "680 ج.م",
                      //   fontSize = 14.sp,
                      //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                      //   color = Color(0xFFFFFFFF),
                      //   textAlign = TextAlign.Center)
                      Text(
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
              // InkWell(
              //   onTap: () {
              //     DashBoardCubit.get(context).changeIndex(1);
              //   },
              //   child: Container(
              //     width: 90.0.w,
              //     height: 90.0.h,
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Color(0xFF2196F3),
              //         width: 2.0.w,
              //       ),
              //       borderRadius: BorderRadius.circular(12.0.r),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         //The element type 'AssetImage' can't be assigned to the list type 'Widget'.
              //         Image( image:   AssetImage('assets/images/scan-qrcode_svgrepo.com.jpg'),),
              //         Text(
              //           'امسح QR',
              //           style: TextStyle(
              //             fontFamily: 'Montserrat-Arabic',
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.w300,
              //             fontSize: 14,
              //             height: 16 / 14,
              //             color: Color(0xFF333333),
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),
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
              SchedulesList(),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.0.w,
//                   ),
//                   ////ListView.builder(
//                   // //   itemCount: userSchedules.length,
//                   // //   itemBuilder: (context, index) {
//                   // //     var schedule = userSchedules[index];
//                   // //     var startTime = DateFormat('hh a', 'ar').format(schedule.startTime.toDate());
//                   // //     var date = DateFormat('yyyy/MM/dd EEEE', 'ar').format(schedule.date.toDate());
//                   // //     var formattedSchedule = '$startTime $date';
//                   // //
//                   // //     return Text(formattedSchedule);
//                   // //   },
//                   // // ),
//                   child:
//                   //i want to get the first 1 in global variable
//                   FirestoreListView(
//                     query: FirebaseFirestore.instance.
//                     collection('users').
//                     doc(FirebaseAuth.instance.currentUser!.uid).
//                     collection('schedules'),
//                         //.orderBy('start_time_hour', descending: true),
//                     itemBuilder: (BuildContext context, DocumentSnapshot documentSnapshot) {
//                       initializeDateFormatting();
//                       var schedule = documentSnapshot.data() as Map<String, dynamic>;
//
//                       var startTime = DateFormat('hh a', 'ar').format(schedule['start_time'].toDate());
//                       var startTime2 = DateFormat('hh').format(schedule['start_time'].toDate());
//                       //compare startTime3 > currentTime3
//                       var startTime3 = TimeOfDay.fromDateTime(schedule['start_time'].toDate());
//                       //get current time as TimeOfDay
//                       var currentTime3 = TimeOfDay.now();
//                       var date = DateFormat('yyyy/MM/dd', 'ar').format(schedule['start_time'].toDate());
//                       var day = DateFormat('EEEE', 'ar').format(schedule['start_time'].toDate());
//                       // Get current day and time
//                       var currentDay = DateFormat('EEEE', 'ar').format(DateTime.now());
//                     //  var currentTime = DateFormat('hh a', 'ar').format(DateTime.now());
// // // Check if the schedule is for today and its start time is after the current time
//                       bool comparison = startTime3.hour > currentTime3.hour;
//                       bool comparison2 =false;
//                       print('comparison: $comparison');
//                       print('startTime3.hour: ${startTime3.hour}');
//                       print('currentTime3.hour: ${currentTime3.hour}');
//                       if (DashBoardCubit.get(context).firstSchedule != null) {
//                         comparison2=TimeOfDay.fromDateTime(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate()).hour > startTime3.hour ;
//                       }
//                          // startTime3.hour > currentTime3.hour ;
//                      print(day == currentDay);
//                      print(comparison);
//                       if (day == currentDay
//                           && comparison &&
//                           (DashBoardCubit.get(context).firstSchedule == null
//                               ||
//                               comparison2
//                       //        TimeOfDay.fromDateTime(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate()).hour > startTime3.hour
//                                       )
//                       ) {
//
//                         DashBoardCubit.get(context).firstSchedule = SchedulesModel.fromJson2(schedule);
//                      DashBoardCubit.get(context).updateFirstSchedule(DashBoardCubit.get(context).firstSchedule!);
//                       }
//                       //   debug that TimeOfDay.fromDateTime(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate()).hour > startTime3.hour)) {
//                      // print('firstSchedule hour: ${TimeOfDay.fromDateTime(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate()).hour}');
//                       //                      DateTime.parse(startTime2).isAfter(DateTime.parse(currentTime2))
//                     //  print('startTime3: $startTime3, currentTime3: $currentTime3');
//                       //debug print
//                     //  print('firstSchedule: ${DashBoardCubit.get(context).firstSchedule}');
//                       //day and current day
//                    //   print('day: $day, currentDay: $currentDay');
//                       //startTime and currentTime
//                    //   print('startTime: $startTime, currentTime: $currentTime');
//                       //dateTime parse
//                      // print('DateTime.parse(startTime): ${DateTime.parse(startTime)}, DateTime.parse(currentTime): ${DateTime.parse(currentTime)}');
//                       var formattedSchedule = '$startTime $date';
//                       return Column(
//                         children: [
//                           Container(
//                             width: 310.0.w,
//                             height: 20.0.h,
//                             decoration: BoxDecoration(
//                               color: Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius.circular(4.0.r),
//                               border: Border.all(
//                                 color: Color(0xFF2196F3),
//                                 width: 1.0.w,
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//
//                                 Text(
//                                   startTime,
//                                   style: TextStyle(
//                                     fontFamily: 'IBM Plex Sans Arabic',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12,
//                                     height: 14 / 12,
//                                     color: Color(0xFF333333),
//                                   ),
//                                 ),
//                                 Text(
//                                   date,
//                                   style: TextStyle(
//                                     fontFamily: 'IBM Plex Sans Arabic',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12,
//                                     height: 14 / 12,
//                                     color: Color(0xFF333333),
//                                   ),
//                                 ),
//                                 Text(
//                                   day,
//                                   style: TextStyle(
//                                     fontFamily: 'IBM Plex Sans Arabic',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12,
//                                     height: 14 / 12,
//                                     color: Color(0xFF333333),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           //15
//                           SizedBox(height: 12.0.h),
//                         ],
//                       );
//                     },
//                     cacheExtent: 100,
//                     physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     pageSize: 30,
//                     emptyBuilder: (BuildContext context) {
//                       return Center(child: Text('No Data'));
//                     },
//
//                   ),
//                 ),
//               ),


            ],
          ),
          condition:
              //zbt no wifi from here
            //  true,
          DashBoardCubit.get(context).coach?.name != null ||  DashBoardCubit.get(context).coach?.hourlyRate != null
        ||state is GetUserDataSuccessState,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),

        );
  },
);
          }

  }
