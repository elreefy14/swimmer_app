part of 'dash_board_cubit.dart';

@immutable
abstract class DashBoardState {}

class DashBoardInitial extends DashBoardState {}
//GetUserDataLoadingState
class GetUserDataLoadingState extends DashBoardState {}
//GetUserDataSuccessState
class GetUserDataSuccessState extends DashBoardState {}
//GetUserDataErrorState/
class GetUserDataErrorState extends DashBoardState {
  final String error;
  GetUserDataErrorState({required this.error});
}