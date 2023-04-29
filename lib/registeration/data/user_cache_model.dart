class UserCacheModel {
  final String token;
  final String uid;
  final String email;
  final String name;
  final String phone;
  final int level;
  final int hourlyRate;
  final int totalHours;
  final int totalSalary;
  final int currentMonthHours;
  final int currentMonthSalary;

  UserCacheModel({
    required this.token,
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.level,
    required this.hourlyRate,
    required this.totalHours,
    required this.totalSalary,
    required this.currentMonthHours,
    required this.currentMonthSalary,
  });

  factory UserCacheModel.fromJson(Map<String, dynamic> json) {
    return UserCacheModel(
      token: json['token'],
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      level: json['level'],
      hourlyRate: json['hourly_rate'],
      totalHours: json['total_hours'],
      totalSalary: json['total_salary'],
      currentMonthHours: json['current_month_hours'],
      currentMonthSalary: json['current_month_salary'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'uid': uid,
    'email': email,
    'name': name,
    'phone': phone,
    'level': level,
    'hourly_rate': hourlyRate,
    'total_hours': totalHours,
    'total_salary': totalSalary,
    'current_month_hours': currentMonthHours,
    'current_month_salary': currentMonthSalary,
  };
}