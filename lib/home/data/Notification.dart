class NotificationModel {
  final String body;
  final DateTime date;

  NotificationModel({required this.body, required this.date});
//fromJson
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      body: json['body'],
      date: DateTime.parse(json['date']),
    );
  }
//toJson
  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'date': date.toString(),
    };
  }

}