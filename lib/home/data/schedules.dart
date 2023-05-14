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

  //to json function
  Map<String, dynamic> toJson() {
    return {
      'branch_id': branchId,
      'start_time': startTime?.toDate().toIso8601String(),
      'end_time': endTime?.toDate().toIso8601String(),
      'date': date?.toDate().toIso8601String(),
      'finished': finished,
    };
  }



  //from json function
//from json function
  factory SchedulesModel.fromJson(Map<String, dynamic> json) {
    return SchedulesModel(
      branchId: json['branch_id'],
      startTime: json['start_time'] != null ? Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(json['start_time']).millisecondsSinceEpoch) : null,
      endTime: json['end_time'] != null ? Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(json['end_time']).millisecondsSinceEpoch) : null,
      date: json['date'] != null ? Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(json['date']).millisecondsSinceEpoch) : null,
      finished: json['finished'],
    );
  }


}




