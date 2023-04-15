import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    print('dioHelper Initialized');
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> postData({
    Map<String, dynamic> ?data
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': 'key = AAAAG6Md4S8:APA91bFlbVtxHr_Bji1plA5yYsElDyaiyy2EVALlFMbdsU0PW6QVWBCJRgt97aqKhp63YWbHn4RddBZ0PwSKtfG3_m4QprzON1oFUFlMMqYrCAXiYAZO9FPwQL2btNjJtW763XjAZ983'
    };
    return await dio.post(
      'https://fcm.googleapis.com/fcm/send',
      data: data,
    ).catchError((error) {
      print('Error in DioHelper \n\n\n');
      print(error.toString());
    });
  }
}
