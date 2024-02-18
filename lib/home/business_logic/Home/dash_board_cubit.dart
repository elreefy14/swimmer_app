import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swimmer_app/home/data/schedules.dart';
import 'package:swimmer_app/home/data/userModel.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());
  static DashBoardCubit get(context) => BlocProvider.of(context);
 SchedulesModel? firstSchedule;
  UserModel? coach ;
bool isCoachfull = false;
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
          //debug
      print('value.exists ${value.exists}');
      //debug hourlyRate
      print('value.data()!\n ${value.data()}');
      if (value.exists) {
        coach = UserModel.fromJson(value.data()!);
        emit(GetUserDataSuccessState());
      }
      isCoachfull = true;
    });
    isCoachfull = true;
    emit(GetUserDataSuccessState());
  }
  }
