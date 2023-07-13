import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swimmer_app/home/business_logic/Home/home_cubit.dart';

import '../../../registeration/data/user_cache_model.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial()){
   // _listenToConnectivityChanges();
  }
  static QrCubit get(context) => BlocProvider.of(context);

  Future<void> saveAttendanceDataLocally(String coachId, String scheduleId, DateTime timestamp) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    List<String> attendanceList = sharedPreferences.getStringList('offlineAttendance') ?? [];

    Map<String, dynamic> attendanceData = {
      'coach_id': coachId,
      'schedule_id': scheduleId,
      'timestamp': timestamp.toIso8601String(),
    };

    attendanceList.add(jsonEncode(attendanceData));
    sharedPreferences.setStringList('offlineAttendance', attendanceList);
    print('Attendance data saved locally');
  }

  // Future<bool> isConnected() async {
  //   ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
  //   return connectivityResult != ConnectivityResult.none;
  // }

  Future<void> syncOfflineAttendanceData(context) async {

    final sharedPreferences = await SharedPreferences.getInstance();
    List<String> attendanceList = sharedPreferences.getStringList('offlineAttendance') ?? [];

    if (attendanceList.isNotEmpty) {
      print('Syncing offline attendance data...');
      for (String attendanceJson in attendanceList) {
        Map<String, dynamic> attendanceData = jsonDecode(attendanceJson);

        // Check for duplicates or conflicts before uploading
        // ...

        // Get the scheduleid and timestamp from the attendance data
        // then go to the schedules collection and make finished = true for the schedule with this id and timestamp
        print('Syncing attendance data for schedule ID ${attendanceData['schedule_id']}');
        await addAttendance(attendanceData['schedule_id'],hourlyRate: HomeCubit.get(context).userCacheModel?.hourlyRate);
      }
      // Clear the locally stored attendance data after successful sync
      sharedPreferences.remove('offlineAttendance');
      print('Offline attendance data synced successfully');
    } else {
      print('No offline attendance data to sync');
    }
  }

  Future<void> syncData(
      context,
      ) async {
    if (await checkInternetConnection()) {
          await HomeCubit.get(context).getUserData();
          await syncOfflineAttendanceData(context);

        } else {
          print('No internet connection');
        }
  }

  //edit this function to get schedules for current coach and date(timeStamp) equal to today and finished = false
  //subtract start time for each schedule from timestamp.now and get the smallest one
  //make bool finished = true for the smallest one
  //this is my **Collections and Documents:**
// 1. **users**: A collection to store the information of all coaches.   - Document ID: unique coach ID   - Fields: `name`, `level`, `hourly_rate`, `total_hours`, `total_salary`, `current_month_hours`, `current_month_salary`
// 2. **branches**: A collection to store the information of all branches.   - Document ID: unique branch ID   - Fields: `name`, `address`
// 3. **schedules**: A collection to store the information of all schedules.   - Document ID: unique schedule ID   - Fields: `coach_id`, `branch_id`, `start_time`, `end_time`, `date`,  `finished `,
// 4. **attendanceRequests**: A collection to store the attendance requests sent by coaches.   - Document ID: unique attendance request ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'pending', 'accepted', 'rejected')
// 5. **salaryHistory**: A subcollection inside the coach document to store the salary history of each coach.   - Document ID: unique salary history ID (usually just the month and year)   - Fields: `month`, `year`, `total_hours`, `total_salary`
  Future<void> onQRCodeScanned({required String coachId, required String scheduleId ,
    required int hourlyRate
  }) async {
    DateTime timestamp = DateTime.now();
    Timestamp today = Timestamp.fromDate(DateTime.now());

    if (await checkInternetConnection()) {
      // Get today's unfinished schedules for the current coach
      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('schedules')
      //     .where('coach_id', isEqualTo: coachId)
      //     .where('date', isEqualTo: today)
      //     .where('finished', isEqualTo: false)
      //     .get();
      //
      // // If there are any unfinished schedules
      // if (querySnapshot.docs.isNotEmpty) {
      //   // Find the schedule closest to the current time
      //   DocumentSnapshot closestSchedule = querySnapshot.docs.first;
      //   Duration smallestDuration = timestamp
      //       .difference(closestSchedule['start_time'].toDate())
      //       .abs();
      //
      //   for (DocumentSnapshot doc in querySnapshot.docs) {
      //     Duration currentDuration =
      //     timestamp.difference(doc['start_time'].toDate()).abs();
      //     if (currentDuration < smallestDuration) {
      //       smallestDuration = currentDuration;
      //       closestSchedule = doc;
      //     }
      //   }

      // Update the closest schedule's finished status to true
      // await FirebaseFirestore.instance
      //     .collection('schedules')
      //     .doc(scheduleId)
      //     .update({'finished': true});
      addAttendance(scheduleId, hourlyRate: hourlyRate);
      //  }
    } else {
      print('No internet connection, saving attendance data locally');
      await saveAttendanceDataLocally(coachId, scheduleId, timestamp);
    }
  }
  Future<void> addAttendance(String scheduleId,{int? hourlyRate}) async {
try {
  await FirebaseFirestore.instance
      .collection('users')
      .doc( FirebaseAuth.instance.currentUser!.uid )
      .collection('schedules')
      .doc(scheduleId)
      .get().then((value) async {
    if(value['finished'] == false){
      await  FirebaseFirestore.instance.collection('users')
          .doc( FirebaseAuth.instance.currentUser!.uid )
          .collection('schedules')
          .doc(scheduleId)
          .update({
        'finished': true,
      });
      final start = value['start_time'] as Timestamp;
      final end = value['end_time'] as Timestamp ;
      //plus 1 minute
      final start_time = start.toDate();
      final end_time = end.toDate();
      //add 1 minute to end time
      // end_time.add(Duration(minutes: 2));
      final duration = end_time.add(Duration(minutes: 1)).difference(start_time).inHours;
      final duration2 = end_time.add(Duration(minutes: 1)).difference(start_time).inMinutes;
      print('duration is $duration');
      print('duration2 is $duration2');
      print('hourly rate is $hourlyRate');
      //go to users collection and update total hours and total salary by multiplying duration by hourly rate
      await  FirebaseFirestore.instance
          .collection('users')
          .doc( FirebaseAuth.instance.currentUser!.uid )
          .update({'totalHours': FieldValue.increment(duration),
        'totalSalary': FieldValue.increment(duration*hourlyRate!),
      });
      print('Attendance added successfully');
      //await getUserData();
    }
    else{
      print('Attendance already added');
    }
  });
} catch (e) {
  print('Error adding attendance');
  print(e.toString());
}




  }
// void _listenToConnectivityChanges() {
//   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
//     if (result != ConnectivityResult.none) {
//       print('Network is available');
//       await syncOfflineAttendanceData();
//     } else {
//       print('Network is not available');
//     }
//   });
// }
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }


}
