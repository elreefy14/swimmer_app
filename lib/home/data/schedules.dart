// SchedulesModel schedulesModel = SchedulesModel(
//   coachId: 'coachId',
//   branchId: 'branchId',
//   startTime: 'startTime',
//   endTime: 'endTime',
//   date: 'date',
//   finished: false,
// );
import 'package:cloud_firestore/cloud_firestore.dart';



class SchedulesModel {
//  SchedulesModel schedulesModel = SchedulesModel(
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
  //parse json to RegisterErrorModel class without using json_serializable

  String? branchId;
  Timestamp? startTime;
  Timestamp? endTime;
  Timestamp? date;
  bool? finished;

  SchedulesModel({

    required this.branchId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.finished,

  });

  //from json function
  factory SchedulesModel.fromJson(Map<String, dynamic> json) {
    return SchedulesModel(

      branchId: json['branchId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      date: json['date'],
      finished: json['finished'],

    );
  }


  //to json function
  Map<String, dynamic> toJson() {
    return {
      'branchId': branchId,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'finished': finished,

    };
  }
}




