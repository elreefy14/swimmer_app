import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../business_logic/Home/dash_board_cubit.dart';
import '../../data/schedules.dart';

class SchedulesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
        ),
        child: FirestoreListView(
          query: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('schedules'),
          itemBuilder: (BuildContext context, DocumentSnapshot documentSnapshot) {
            initializeDateFormatting();
            var schedule = documentSnapshot.data() as Map<String, dynamic>;

            var startTime = DateFormat('hh a', 'ar').format(schedule['start_time'].toDate());
            var startTime3 = TimeOfDay.fromDateTime(schedule['start_time'].toDate());
            var currentTime3 = TimeOfDay.now();
            var date = DateFormat('yyyy/MM/dd', 'ar').format(schedule['start_time'].toDate());
            var day = DateFormat('EEEE', 'ar').format(schedule['start_time'].toDate());
            var currentDay = DateFormat('EEEE', 'ar').format(DateTime.now());

            bool comparison = startTime3.hour > currentTime3.hour;
            bool comparison2 = false;
            if (DashBoardCubit.get(context).firstSchedule != null) {
              comparison2 = TimeOfDay.fromDateTime(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate()).hour > startTime3.hour;
            }

            if (day == currentDay && comparison && (DashBoardCubit.get(context).firstSchedule == null || comparison2)) {
              DashBoardCubit.get(context).firstSchedule = SchedulesModel.fromJson2(schedule);
              DashBoardCubit.get(context).updateFirstSchedule(DashBoardCubit.get(context).firstSchedule!);
            }
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
      ),
    );
  }
}