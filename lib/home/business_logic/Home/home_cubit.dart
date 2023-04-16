import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/schedules.dart';
import '../../data/userModel.dart';
import 'home_state.dart';
//**Collections and Documents:**
// 1. **users**: A collection to store the information of all coaches.   - Document ID: unique coach ID   - Fields: `name`, `level`, `hourly_rate`, `total_hours`, `total_salary`, `current_month_hours`, `current_month_salary`
// 2. **branches**: A collection to store the information of all branches.   - Document ID: unique branch ID   - Fields: `name`, `address`
// 3. **schedules**: A collection to store the information of all schedules.   - Document ID: unique schedule ID   - Fields: `coach_id`, `branch_id`, `start_time`, `end_time`, `date`,  `finished `,
// 4. **attendanceRequests**: A collection to store the attendance requests sent by coaches.   - Document ID: unique attendance request ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'pending', 'accepted', 'rejected')
// 5. **salaryHistory**: A subcollection inside the coach document to store the salary history of each coach.   - Document ID: unique salary history ID (usually just the month and year)   - Fields: `month`, `year`, `total_hours`, `total_salary`

// **Workflow:**
// 1. When a coach logs in, retrieve their information from the `coaches` collection, display their name, training hours, and branches they're assigned to.
// 2. To display the schedules for each coach, query the `schedules` collection with the `coach_id`. Use the `branch_id` to get branch details from the `branches` collection.
// 3. When a coach arrives at their schedule, they create a new document in the `attendanceRequests` collection with the `coach_id`, `schedule_id`, and `status` as 'pending'.
// 4. The admin reviews the attendance requests and updates the `status` field to 'accepted' or 'rejected'.
// 5. Upon receiving an 'accepted' status, calculate the hours worked for that schedule and update the coach's `total_hours`, `total_salary`, `current_month_hours`, and `current_month_salary` in the `coaches` collection.
// 6. At the end of each month, create a new document in the `salaryHistory` subcollection for each coach, storing their `total_hours` and `total_salary` for the current month. After that, reset the `current_month_hours` and `current_month_salary` fields in the `coaches` collection.
// 7. To display the salary history for each coach, query the `salaryHistory` subcollection inside the coach document and show the list containing the current month's total hours and salary, along with all previous months.
// This design allows you to efficiently handle the required functionality while minimizing the number of reads and writes to the Firestore database.

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
//**Collections and Documents:**
// 1. **users**: A collection to store the information of all coaches.   - Document ID: unique coach ID   - Fields: `name`, `level`, `hourly_rate`, `total_hours`, `total_salary`, `current_month_hours`, `current_month_salary`
// 2. **branches**: A collection to store the information of all branches.   - Document ID: unique branch ID   - Fields: `name`, `address`
// 3. **schedules**: A collection to store the information of all schedules.   - Document ID: unique schedule ID   - Fields: `coach_id`, `branch_id`, `start_time`, `end_time`, `date`,  `finished `,
// 4. **attendanceRequests**: A collection to store the attendance requests sent by coaches.   - Document ID: unique attendance request ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'pending', 'accepted', 'rejected')
// 5. **salaryHistory**: A subcollection inside the coach document to store the salary history of each coach.   - Document ID: unique salary history ID (usually just the month and year)   - Fields: `month`, `year`, `total_hours`, `total_salary`

// **Workflow:**
// 1. When a coach logs in, retrieve their information from the `coaches` collection, display their name, training hours, and branches they're assigned to.
// 2. To display the schedules for each coach, query the `schedules` collection with the `coach_id`. Use the `branch_id` to get branch details from the `branches` collection.
// 3. When a coach arrives at their schedule, they create a new document in the `attendanceRequests` collection with the `coach_id`, `schedule_id`, and `status` as 'pending'.
// 4. The admin reviews the attendance requests and updates the `status` field to 'accepted' or 'rejected'.
// 5. Upon receiving an 'accepted' status, calculate the hours worked for that schedule and update the coach's `total_hours`, `total_salary`, `current_month_hours`, and `current_month_salary` in the `coaches` collection.
// 6. At the end of each month, create a new document in the `salaryHistory` subcollection for each coach, storing their `total_hours` and `total_salary` for the current month. After that, reset the `current_month_hours` and `current_month_salary` fields in the `coaches` collection.
// 7. To display the salary history for each coach, query the `salaryHistory` subcollection inside the coach document and show the list containing the current month's total hours and salary, along with all previous months.
// This design allows you to efficiently handle the required functionality while minimizing the number of reads and writes to the Firestore database.

//finction to add random ummy values to schedules in firebase firestore
  void addSchedule(String coachId, String startTime, String endTime, int dayOfWeek) {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
    Timestamp startTimestamp = Timestamp.fromDate(startOfMonth);
    Timestamp endTimestamp = Timestamp.fromDate(endOfMonth);

    for (int day = 1; day <= endOfMonth.day; day++) {
      DateTime date = DateTime(now.year, now.month, day);
      if (date.weekday == dayOfWeek) {
        SchedulesModel schedulesModel = SchedulesModel(
          coachId: coachId,
          branchId: 'branchId',
          endTime: endTime,
          startTime: startTime,
          date: Timestamp.fromDate(date),
          finished: false,
        );
        FirebaseFirestore.instance
            .collection('schedules')
            .add(schedulesModel.toJson())
            .then((value) {
          print(value.id);
        }).catchError((error) {
          print(error.toString());
        });
      }
    }
  }

  //get all schedules for current user using FireBAse.uid of current user
  //and day in date field equal to today but them in a list of schedules
  List<SchedulesModel> schedules = [];
  void getSchedules({required DateTime specificDate}) {
    DateTime startOfDay = DateTime(specificDate.year, specificDate.month, specificDate.day);
    DateTime endOfDay = DateTime(specificDate.year, specificDate.month, specificDate.day, 23, 59, 59);
    Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
    Timestamp endTimestamp = Timestamp.fromDate(endOfDay);
   print('-----------------');
    print(startTimestamp);
    print(endTimestamp);
    print('-----------------');

    emit(GetSchedulesLoadingState());

    FirebaseFirestore.instance
        .collection('schedules')
        .where('coachId', isEqualTo: 'rafik')
        .where('date', isGreaterThanOrEqualTo: startTimestamp)
        .where('date', isLessThanOrEqualTo: endTimestamp)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        schedules.add(SchedulesModel.fromJson(element.data()));
        print(element.data());
        print('-----------------');
        print(schedules.length);
      });
      print('-----------------');
      print(schedules.length);
      emit(GetSchedulesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSchedulesErrorState(error: error.toString()));
    });
  }




}
//tod
