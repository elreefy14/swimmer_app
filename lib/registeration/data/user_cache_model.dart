class UserCacheModel {
   String? token;
   String? uid;
   String? email;
   String? name;
   String? phone;
   String? image;
   int? level;
   int? hourlyRate;
   int? totalHours;
   int? totalSalary;
   int? currentMonthHours;
   int? currentMonthSalary;

  UserCacheModel({
   this.token,
   this.uid,
   this.email,
   this.name,
   this.phone,
   this.level,
   this.hourlyRate,
   this.totalHours,
   this.totalSalary,
   this.currentMonthHours,
   this.currentMonthSalary,
    this.image,
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
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
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