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
// SchedulesModel schedulesModel = SchedulesModel(
//   coachId: 'coachId',
//   branchId: 'branchId',
//   startTime: 'startTime',
//   endTime: 'endTime',
//   date: 'date',
//   finished: false,
// );
  //parse json to RegisterErrorModel class without using json_serializable
  String? coachId;
  String? branchId;
  String? startTime;
  String? endTime;
  Timestamp? date;
  bool? finished;
  SchedulesModel({
    required this.coachId,
    required this.branchId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.finished,
  });
  SchedulesModel.fromJson(Map<String, dynamic> json) {
    coachId = json['coachId'];
    branchId = json['branchId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    finished = json['finished'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coachId'] = this.coachId;
    data['branchId'] = this.branchId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['date'] = this.date;
    data['finished'] = this.finished;
    return data;
  }

}


