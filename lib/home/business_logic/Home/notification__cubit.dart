// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'notification__state.dart';
//
// // part 'notification__state.dart';
// //The argument type 'List<dynamic>' can't be assigned to the parameter type 'List<Map<String, dynamic>>'.
// class NotificationCubit extends Cubit<NotificationState> {
//   NotificationCubit() : super(NotificationState(notifications: [])) {
//   }
//
//   static NotificationCubit get(context) => BlocProvider.of(context);
//
//   Future<void> fetchNotifications(String userId) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final notificationsJson = sharedPreferences.getString('notifications') ?? '[]';
//     final notifications = List<Map<String, dynamic>>.from(jsonDecode(notificationsJson));
//     emit(NotificationState(notifications: notifications));
//
//     // Fetch notifications from Firestore and store them in SharedPreferences
//     final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
//     final querySnapshot = await userRef.collection('notifications').orderBy('date', descending: true).get();
//     final fetchedNotifications = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//
//     sharedPreferences.setString('notifications', jsonEncode(fetchedNotifications));
//   }
//
//   Future<void> loadMoreNotifications() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final notificationsJson = sharedPreferences.getString('notifications') ?? '[]';
//     final notifications = List<Map<String, dynamic>>.from(jsonDecode(notificationsJson));
//     final currentNotifications = state.notifications;
//     final startIndex = currentNotifications.length;
//     final endIndex = startIndex + 10;
//     final newNotifications = notifications.sublist(startIndex, endIndex);
//     final updatedNotifications = List.from(currentNotifications)..addAll(newNotifications);
//     emit(NotificationState(notifications: updatedNotifications));
//   }
// }
