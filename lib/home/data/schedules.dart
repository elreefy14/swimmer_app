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

  bool? finished;

  SchedulesModel({

    required this.branchId,
    required this.startTime,
    required this.endTime,

    required this.finished,

  });

  //to json function
  Map<String, dynamic> toJson() {
    return {
      'branch_id': branchId,
      'start_time': startTime?.toDate().toIso8601String(),
      'end_time': endTime?.toDate().toIso8601String(),
      'finished': finished,
    };
  }

factory SchedulesModel.fromJson2(Map<String, dynamic> json) {
    return SchedulesModel(

      branchId: json['branch_id'],
      startTime: json['start_time'],
      endTime: json['end_time'],

      finished: json['finished'],
    );
  }

  factory SchedulesModel.fromJson(Map<String, dynamic> json) {
    return SchedulesModel(
      branchId: json['branch_id'],
      startTime: json['start_time'] != null ? Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(json['start_time']).millisecondsSinceEpoch) : null,
      endTime: json['end_time'] != null ? Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(json['end_time']).millisecondsSinceEpoch) : null,

      finished: json['finished'],
    );
  }
  // to json function
  Map<String, dynamic> toJson2() {
    return {
      'branch_id': branchId,
      'start_time': startTime,
      'end_time': endTime,
      'finished': finished,
    };
  }

}




