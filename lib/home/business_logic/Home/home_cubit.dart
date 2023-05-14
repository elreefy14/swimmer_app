import 'dart:async';
import 'dart:convert';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swimmer_app/core/cashe_helper.dart';
import '../../data/schedules.dart';
import '../../data/userModel.dart';
import 'home_state.dart';
// ****this is my firestore Collections and Documents:**
// - *users*: A collection to store the information of all coaches.
// - Document ID: unique coach ID
// - Fields: *`name`, *`level`*, *`hourly_rate`*, *`total_hours`*, *`total_salary`*, *`current_month_hours`*, *`current_month_salary`**
// - Subcollection: *`schedules`*
// - Document ID: unique schedule ID
// - Fields: *`branch_id`, *`start_time`*, *`end_time`*, *`date`*, *`finished`**
// - Subcollection: *`attendance`*
// - Document ID: unique attendance ID (usually just the coach ID)
// - Fields: *`attended`, *`qr_code`**
// - Subcollection: *`salaryHistory`*
// - Document ID: unique salary history ID (usually just the month and year)
// - Fields: *`month`, *`year`*, *`total_hours`*, *`total_salary`**
// - Fields: *`branches`* (array of branch IDs that the coach works at)
//
// - *branches*: A collection to store the information of all branches.
// - Document ID: unique branch ID
// - Fields: *`name`, *`address`**
// - Subcollection: *`coaches`*
// - Document ID: unique coach ID who works at this branch
//
// - *admins*: A collection to store the information of all admins.
// - Document ID: unique admin ID
// - Fields: *`name`, *`email`*, *`branch_id`** (the ID of the branch they're responsible for)
//
// - *schedules*: A collection to store the information of all schedules.
// - Document ID: unique schedule ID
// - Fields: *`branch_id`, *`start_time`*, *`end_time`*, *`date`**
// - Subcollection: *`attendance`*
// - Document ID: unique attendance ID (usually just the coach ID)
// - Fields: *`attended`, *`qr_code`**

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState()) {
    // Call this method when connectivity changes
    _listenToConnectivityChanges();
  }


  static HomeCubit get(context) => BlocProvider.of(context);
//make function to get all schedules for specific coach 
//for the next 20 days store them in shared preferences and sort them by date
//then when the coach open the app check if the date between first and last date in shared preferences bigger than 10 days 
//if yes then get list of schedules from shared preferences 
//else if no then get list of schedules from firestore and store them in shared preferences 
 
  //List<SchedulesModel> userSchedules = [];
  Future<List<SchedulesModel>> getAllSchedulesForSpecificUser() async {
    emit(LoadingState());
    print('Getting all schedules for specific coach');

    print('FirebaseAuth.instance.currentUser!.uid: ${FirebaseAuth.instance.currentUser!.uid}');

    List<SchedulesModel>? schedules =await CacheHelper.getSchedulesFromSharedPreferences();
    print('schedules.length: ${schedules.length}');
    print('\n\n\n\n\n');
    if (schedules.length < 20) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid??'fnBisJY3vGgHL3on0tYeAJWI5GA2')
        .collection('schedules')
    //.orderBy('date', descending: false)
    .limit(20 - schedules.length)
        .get()
        .then((querySnapshot) async {
      print('Successfully retrieved all schedules for specific coach');
      print('querySnapshot.docs.length: ${querySnapshot.docs.length}');

      querySnapshot.docs.forEach((doc) {
        var schedule = SchedulesModel.fromJson(doc.data());
        var startTime = DateFormat('hh a', 'ar').format(schedule.startTime!.toDate());
        var date = DateFormat('yyyy/MM/dd EEEE', 'ar').format(schedule.date!.toDate());
        var formattedSchedule = '$startTime $date';
        print('formattedSchedule: $formattedSchedule');
        schedules.add(schedule);
      });


      await CacheHelper.storeSchedulesInSharedPreferences(schedules);
    print('schedules.length: ${schedules.length}');
      emit(GetAllSchedulesForSpecificCoachSuccessState());
    })
        .catchError((error){
      print('Failed to retrieve all schedules for specific coach due to error: $error');
      emit(GetAllSchedulesForSpecificCoachErrorState(error: error.toString()));
    });
  }
    return schedules;
  }
  // Future<void> storeSchedulesInSharedPreferences(List<SchedulesModel> schedules) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var encodedSchedules = jsonEncode(schedules.map((schedule) => schedule.toJson()).toList());
  //     await prefs.setString('schedules', encodedSchedules);
  //     emit(StoreSchedulesInSharedPreferencesSuccessState());
  //   } catch (error) {
  //     print('Failed to store schedules in shared preferences due to error: $error');
  //     emit(StoreSchedulesInSharedPreferencesErrorState(error: error.toString()));
  //   }
  // }
  //
  // Future<List<SchedulesModel>> getCachedSchedules() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var encodedSchedules = prefs.getString('schedules');
  //   List<SchedulesModel> schedules = [];
  //
  //   if (encodedSchedules != null) {
  //     var decodedSchedules = jsonDecode(encodedSchedules);
  //     decodedSchedules.forEach((schedule) {
  //       schedules.add(SchedulesModel.fromJson(schedule));
  //     });
  //   }
  //   print('schedules.length: ${schedules.length}');
  //
  //   return schedules;
  // }

  //todo: mohm dh ya rafiiiiiiiiiiiiiiiiiik11 lw 3atz t3ed schedules yb2a kda
//ListView.builder(
//   itemCount: userSchedules.length,
//   itemBuilder: (context, index) {
//     var schedule = userSchedules[index];
//     var startTime = DateFormat('hh a', 'ar').format(schedule.startTime.toDate());
//     var date = DateFormat('yyyy/MM/dd EEEE', 'ar').format(schedule.date.toDate());
//     var formattedSchedule = '$startTime $date';
//
//     return Text(formattedSchedule);
//   },
// ),
  //Todo: mohm dh ya rafiiiiiiiiiiiiiiiiiik11 bos fo2
  //add schedule to coach collection in subcollection schedules
void addScheduleToCoachCollection(
   // SchedulesModel schedule
    ) {
    emit(LoadingState());
    print('Adding schedule to coach collection');
  //  print('schedule: ${schedule.toJson()}');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('schedules')
        .add({
      'branch_id': 'edasdaseeeeeeee',
      'coach_id': 'awak4gIQ28SdtDYLJIEF9phS20p2',
     // 'start_time': Today 8 pm
   //   'end_time':today 10 pm
   //   'date': today
      'start_time': Timestamp.now(),
      'end_time': Timestamp.now(),
      'date': Timestamp.now(),
      'finished': false,

    })
        .then((value) {
      print('Successfully added schedule to coach collection');
      emit(AddScheduleToCoachCollectionSuccessState());
    })
        .catchError((error){
      print('Failed to add schedule to coach collection due to error: $error');
      emit(AddScheduleToCoachCollectionErrorState(error: error.toString()));
    });
  }
  //edit this function to save list of schedules for current coach in a list

  ///////////////////////////////////////////////////////////////////
  // Add this method to listen for connectivity changes
  void _listenToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        print('Network is available');
        await syncOfflineAttendanceData();
      } else {
        print('Network is not available');
      }
    });
  }

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

  Future<bool> isConnected() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> syncOfflineAttendanceData() async {
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
        await addAttendance(attendanceData['schedule_id']);
      }
      // Clear the locally stored attendance data after successful sync
      sharedPreferences.remove('offlineAttendance');
      print('Offline attendance data synced successfully');
    } else {
      print('No offline attendance data to sync');
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
  Future<void> onQRCodeScanned({required String coachId, required String scheduleId}) async {
    DateTime timestamp = DateTime.now();
   Timestamp today = Timestamp.fromDate(DateTime.now());

    if (await isConnected()) {
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
      addAttendance(scheduleId);
    //  }
    } else {
      print('No internet connection, saving attendance data locally');
      await saveAttendanceDataLocally(coachId, scheduleId, timestamp);
    }
  }
  Future<void> addAttendance(String scheduleId) async {
    await FirebaseFirestore.instance
        .collection('schedules')
        .doc(scheduleId)
        .update({
      'finished': true,
    });

    final scheduleSnapshot = await FirebaseFirestore.instance
        .collection('schedules')
        .doc(scheduleId)
        .get();

    final start = scheduleSnapshot['startTime'] as Timestamp;
    final end = scheduleSnapshot['endTime'] as Timestamp;

    final startTime = start.toDate();
    final endTime = end.toDate();

    final duration = endTime.difference(startTime).inHours;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(scheduleSnapshot['coachId'])
        .update({'totalHours': FieldValue.increment(duration)});

    print('Attendance added successfully');
  }

// admin (
// genereate qr code
  //
// Generate a QR code for the schedule using the UUID
 // QrImage qrImage = QrImage(
 //   data: 'schedule:$scheduleId',
 //   version: QrVersions.auto,
 //   size: 200.0,
  //);
  //TODO;subtract now - start time get first schedule
  Future<void> generateQrImageBasedOnNearestSchedule() async {
    emit(GenerateQrImageLoadingState());

    // Get the current timestamp
    DateTime timestamp = DateTime.now();
    Timestamp now = Timestamp.fromDate(timestamp);


    // Query Firestore for the nearest schedule
    QuerySnapshot scheduleQuerySnapshot = await FirebaseFirestore.instance
        .collection('schedules')
        .where('finished', isEqualTo: false)
        //.where('start_time', isGreaterThan: now)
        //.orderBy('start_time', descending: false)
        .get();

    // Check if any schedules were found
    QrImage qrImage;
    if (scheduleQuerySnapshot.docs.isNotEmpty) {
      // Get the ID of the first schedule document
      String scheduleId = scheduleQuerySnapshot.docs.first.id;

      // Generate a QR code image with the schedule ID as data

      print('\n\n\n\n\n');
      print('$scheduleId');
      print('$scheduleId');
      print('$scheduleId');
      print('$scheduleId');
      print('$scheduleId');
      print('\n\n\n\n\n\n\n');

      qrImage = QrImage(
        data: scheduleId,
        version: QrVersions.auto,
        size: 200.0,
      );
      emit(GenerateQrImageSuccessState());
    } else {
      // Handle case where no schedules were found
      qrImage = QrImage(
        data: "No schedules found",
        version: QrVersions.auto,
        size: 200.0,
      );
      emit(GenerateQrImageErrorState(
          error:'error'
      ));
    }


    // // If there are any unfinished schedules
    // if (querySnapshot.docs.isNotEmpty) {
    //   // Find the schedule closest to the current time
    //   DocumentSnapshot closestSchedule = querySnapshot.docs.first;
    //   Duration smallestDuration = timestamp
    //       .difference(closestSchedule['start_time'].toDate().millisecondsSinceEpoch)
    //       .abs();
    //
    //   for (DocumentSnapshot doc in querySnapshot.docs) {
    //     Duration currentDuration = timestamp
    //         .difference(doc['start_time'].toDate().millisecondsSinceEpoch)
    //         .abs();
    //     if (currentDuration < smallestDuration) {
    //       smallestDuration = currentDuration;
    //       closestSchedule = doc;
    //     }
    //   }

      // Generate a QR code for the schedule using the UUID


      // Update the QR image



    }





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
//todo: add schedule sh3alaaaaaaaaa
//finction to add random ummy values to schedules in firebase firestore
//   void addSchedule(String coachId, Timestamp startTime, Timestamp endTime, int dayOfWeek) {
//     DateTime now = DateTime.now();
//     DateTime startOfMonth = DateTime(now.year, now.month, 1);
//     DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
//     Timestamp startTimestamp = Timestamp.fromDate(startOfMonth);
//     Timestamp endTimestamp = Timestamp.fromDate(endOfMonth);
//
//     for (int day = 1; day <= endOfMonth.day; day++) {
//       DateTime date = DateTime(now.year, now.month, day);
//       if (date.weekday == dayOfWeek) {
//        //schedules: A collection to store the information of all schedules.
//         // // Document ID: unique schedule ID
//         // // Fields:  branch_id, start_time, end_time, date, finished, attendance (map of coach ID to boolean indicating whether they attended)
//         SchedulesModel schedulesModel = SchedulesModel(
//          branchId: 'branchId',
//          startTime: Timestamp.fromDate(DateTime(date.year, date.month, date.day, 8)),
//           endTime: Timestamp.fromDate(DateTime(date.year, date.month, date.day, 10)),
//           date: Timestamp.fromDate(date),
//           finished: false,
//
//              attendance: {
//            'coach1': true,
//                'coach2': false},
//         );
//         FirebaseFirestore.instance
//             .collection('schedules')
//             .add(schedulesModel.toJson())
//             .then((value) {
//           print(value.id);
//         }).catchError((error) {
//           print(error.toString());
//         });
//       }
//     }
//   }

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
      //  .where('coachId', isEqualTo: 'rafik')
      //  .where('date', isGreaterThanOrEqualTo: startTimestamp)
       // .where('date', isLessThanOrEqualTo: endTimestamp)
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

//this is my firebase Collections and Documents and i want to edit some functions in my app
// 1. **users**: A collection to store the information of all coaches.   - Document ID: unique coach ID   - Fields: `name`, `level`, `hourly_rate`, `total_hours`, `total_salary`, `current_month_hours`, `current_month_salary`
// 2. **branches**: A collection to store the information of all branches.   - Document ID: unique branch ID   - Fields: `name`, `address`
// 3. **schedules**: A collection to store the information of all schedules.   - Document ID: unique schedule ID   - Fields:'device id', `coach_id`, `branch_id`, `start_time`, `end_time`, `date`,  `finished `,
// 4. **attendanceRequests**: A collection to store the attendance requests sent by coaches.   - Document ID: unique attendance request ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'pending', 'accepted', 'rejected')
// 5. **salaryHistory**: A subcollection inside the coach document to store the salary history of each coach.   - Document ID: unique salary history ID (usually just the month and year)   - Fields: `month`, `year`, `total_hours`, `total_salary`
// 6. **attendance**: A collection to store the attendance information of each coach.   - Document ID: unique attendance ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'present', 'absent', 'late')

  // final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  // final List<String> detectedBeacons = [];
  // void startScanning() {
  //   emit(StartScanningLoadingState());
  //   flutterBlue.startScan(timeout: Duration(seconds: 4));
  //   flutterBlue.scanResults.listen((results) {
  //     for (ScanResult r in results) {
  //       print('serviceUuids :${r.advertisementData.serviceUuids}');
  //       print('id :${r.device.id}');
  //       print('ssi :${r.rssi}');
  //       detectedBeacons.add(r.device.id.toString());
  //       emit(DetectedBeaconsSuccessState());
  //     print('${detectedBeacons.length}');
  //     }
  //   });
  //   emit(StartScanningSuccessState());
  // }
  // void setUpPeriodicAlarm() async {
  //   await AndroidAlarmManager.periodic(
  //       const Duration(seconds: 4),  // Interval between alarms
  //       0,                            // ID of the alarm (must be unique)
  //       startScanning,                // Callback function to execute
  //       wakeup: true,                 // Wake up the device if necessary
  //       rescheduleOnReboot: true      // Reschedule the alarm after device reboot
  //   );
  //   emit(PeriodicAlarmSuccessState());
  // }
  // void clearDetectedBeacons() {
  //   detectedBeacons.clear();
  //    emit(ClearDetectedBeaconsSuccessState());
  // }
  //edit this function to get all schedules where field date (timestamp) equal to today and field finished equal to false and field device id equal to beacon id
  //then make finished field equal true and add end time - start time to total hours in users collection and add 1 to total attendance in attendance collection

  // //edit this function to get r.device.id.toString() and add it to user collection in field device id
  // Future<String?> getDeviceId() async {
  //   try {
  //     MethodChannel channel = const MethodChannel('samples.flutter.dev/device_id');
  //     String? deviceId = await channel.invokeMethod('getDeviceId');
  //     print("Device ID: '$deviceId'.");
  //     print("\n\n\n\n\n\n\n");
  //     return deviceId;
  //   } on PlatformException catch (e) {
  //     print("Failed to get device ID: '${e.message}'.");
  //     return null;
  //   }
  // }
  // Future<String?> getDeviceIdBySystem() async {
  //   try {
  //     final List<BluetoothDevice> devices = await flutterBlue.connectedDevices;
  //     final BluetoothDevice device = devices.first;
  //     final String deviceId = device.id.toString();
  //     return deviceId;
  //   } catch (e) {
  //     print("Failed to get device ID: '${e.toString()}'.");
  //     return null;
  //   }
  // }
  // Future<String?> getDeviceId3() async {
  //   try {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     String? deviceId;
  //
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //       deviceId = androidInfo.androidId; // Use the Android device ID
  //       print("Device ID: '$deviceId'.");
  //       print("\n\n\n\n\n\n\n");
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //       deviceId = iosInfo.identifierForVendor; // Use the iOS identifier for the vendor
  //     } else {
  //       throw UnsupportedError('This platform is not supported.');
  //     }
  //
  //     return deviceId;
  //   } catch (e) {
  //     print("Failed to get device ID: '${e.toString()}'.");
  //     return null;
  //   }
  // }
   //i want to add this features in my app . 1. *QR Code-based Attendance*: Develop a mobile app that allows employees to scan a unique QR code displayed at the entrance of the workplace. The app then records the timestamp and sends the data to a Firebase Realtime Database or Firestore. You can then generate attendance reports from the stored data.
   // i want to handlewhen employee doesn't have internet connection like that .
   //Handling lack of internet connection
// When an employee scans the QR code, the mobile app records the timestamp and tries to send the data to a Firebase Realtime Database or Firestore. However, if the employee's device doesn't have an internet connection, the data can't be sent immediately. To handle this situation, you can implement an offline data storage mechanism:
//
//     Save the attendance data locally on the employee's device when there is no internet connection. You can use a local storage solution, such as SharedPreferences, to store the data temporarily.
//
//     Monitor the device's internet connection status. You can use libraries such as Reachability (for iOS) or ConnectivityManager (for Android) to detect when the device regains an internet connection.
//
//     When the device reconnects to the internet, sync the locally stored attendance data with the Firebase Realtime Database or Firestore. Ensure that you maintain data integrity by checking for duplicates or conflicts.
// give all functions to handle that
//this is my firebase Collections and Documents and i want to edit some functions in my app . edit it if you want
// 1. **users**: A collection to store the information of all coaches.   - Document ID: unique coach ID   - Fields: `name`, `level`, `hourly_rate`, `total_hours`, `total_salary`, `current_month_hours`, `current_month_salary`
// 2. **branches**: A collection to store the information of all branches.   - Document ID: unique branch ID   - Fields: `name`, `address`
// 3. **schedules**: A collection to store the information of all schedules.   - Document ID: unique schedule ID   - Fields:'device id', `coach_id`, `branch_id`, `start_time`, `end_time`, `date`,  `finished `,
// 4. **attendanceRequests**: A collection to store the attendance requests sent by coaches.   - Document ID: unique attendance request ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'pending', 'accepted', 'rejected')
// 5. **salaryHistory**: A subcollection inside the coach document to store the salary history of each coach.   - Document ID: unique salary history ID (usually just the month and year)   - Fields: `month`, `year`, `total_hours`, `total_salary`
// 6. **attendance**: A collection to store the attendance information of each coach.   - Document ID: unique attendance ID   - Fields: `coach_id`, `schedule_id`, `status`(e.g. 'present', 'absent', 'late')




}
