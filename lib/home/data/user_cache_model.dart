class UserCacheModel {
  final String token;
  final String uid;
  final String email;
  final String name;
  final String phone;

  UserCacheModel({
    required this.token,
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
  });

  factory UserCacheModel.fromJson(Map<String, dynamic> json) {
    return UserCacheModel(
      token: json['token'],
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'uid': uid,
    'email': email,
    'name': name,
    'phone': phone,
  };
}
