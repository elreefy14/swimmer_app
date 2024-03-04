import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swimmer_app/home/data/schedules.dart';

import '../../../core/cashe_helper.dart';
import '../../../registeration/data/user_cache_model.dart';
import '../../presenation/dash_board_screan.dart';
import '../../presenation/home_lauout.dart';
import '../../presenation/notification_screen.dart';
import '../../presenation/profile_screen.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());

  static DashBoardCubit get(context) => BlocProvider.of(context);
 SchedulesModel? firstSchedule;
//  UserModel? coach ;
//bool isCoachfull = false;
  // Future<void> getUserData() async {
  //   emit(GetUserDataLoadingState());
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((value) {
  //         //debug
  //     print('value.exists ${value.exists}');
  //     //debug hourlyRate
  //     print('value.data()!\n ${value.data()}');
  //     if (value.exists) {
  //       coach = UserModel.fromJson(value.data()!);
  //       emit(GetUserDataSuccessState());
  //     }
  //     isCoachfull = true;
  //   });
  //   isCoachfull = true;
  //   emit(GetUserDataSuccessState());
  // }
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
  CoachModel? coach;
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    if (await checkInternetConnection()) {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((value) {
        if (value.exists) {
          var data = value.data();
         // coach = UserModel.fromJson(value.data()!);
          coach = CoachModel(
            image: data?['image'] ??
                'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
            email: user.email ?? '${data?['phone']}@placeholder.com',
            phone: data?['phone'],
            token: data?['deviceToken'][0],
            uId: user.uid,
            fname: data?['fname'],
            lname: data?['lname'],
            name: data?['name'],
            level: data?['level'],
            hourlyRate: data?['hourlyRate'] ?? 30,
            totalHours: data?['totalHours'] ?? 0,
            totalSalary: data?['totalSalary'] ?? 0,
            currentMonthHours: data?['currentMonthHours'] ?? 0,
            currentMonthSalary: data?['currentMonthSalary'] ?? 0,
            branches: (data?['branches'] as List<dynamic>).map((branch) =>
                branch.toString()).toList(),
          );
          CacheHelper.saveUser(coach);
          emit(GetUserDataSuccessState());
        }
        }
      );
    } else {
      coach = await CacheHelper.getUser();
      // coach = UserModel(
      //   name: userCacheModel?.name,
      //   email: userCacheModel?.email,
      //   level: userCacheModel?.level,
      //   hourlyRate: userCacheModel?.hourlyRate,
      //   totalHours: userCacheModel?.totalHours,
      //   totalSalary: userCacheModel?.totalSalary,
      //   currentMonthHours: userCacheModel?.currentMonthHours,
      //   currentMonthSalary: userCacheModel?.currentMonthSalary,
      //   uId: userCacheModel?.uId,
      //   phone: userCacheModel?.phone,
      //   role: userCacheModel?.role,
      // );
      emit(GetUserDataSuccessState());
    }
  }

  void updateFirstSchedule(SchedulesModel schedulesModel) {
    firstSchedule = schedulesModel;
    emit(UpdateFirstScheduleState());
  }
    List<String> listOfTitles = [
      'لوحة التحكم',
      //'مسح الكود',
      //'الملف الشخصي',
      'الاشعارات',
    ];
    final List<String> listOfIcons = [
      'assets/images/dashboard-2_svgrepo.com.svg',
     // 'assets/images/scan-qrcode_svgrepo.com.svg',
     // 'assets/images/🦆 icon _person_.svg',
      'assets/images/Vector.svg',
    ];
    final List<Widget> _screens = [
      DashBoardScreen(),
      //QrScreen(),
     // ProfileScreen(),
      NotificationScreen(),
     // NotificationScreen(),
     // EditProfile(),
    ];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Widget get currentScreen => _screens[_currentIndex];
    //function to change the index of the bottom navigation bar
    void changeIndex(int index) {
      _currentIndex = index;
      emit(ChangeIndexState());
    }
  }
