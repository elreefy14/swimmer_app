import '../../data/schedules.dart';

abstract class HomeState {}
//InitialState
class InitialState extends HomeState {}
//GetSchedulesLoadingState
class GetSchedulesLoadingState extends HomeState {}
//GetSchedulesSuccessState
class GetSchedulesSuccessState extends HomeState {}
//GetSchedulesErrorState
class GetSchedulesErrorState extends HomeState {
  final String error;
  GetSchedulesErrorState({required this.error});
}
//detectedBeaconsSuccessState
class DetectedBeaconsSuccessState extends HomeState {}
//ClearDetectedBeaconsSuccessState
class ClearDetectedBeaconsSuccessState extends HomeState {}
//ChangePasswordVisibilityState
class ChangePasswordVisibilityState extends HomeState {}
//PeriodicAlarmSuccessState
class PeriodicAlarmSuccessState extends HomeState {}
//StartScanningLoadingState
class StartScanningLoadingState extends HomeState {}
//StartScanningSuccessState
class StartScanningSuccessState extends HomeState {}
//GenerateQrImageSuccessState
class GenerateQrImageSuccessState extends HomeState {}
//GenerateQrImageErrorState
class GenerateQrImageErrorState extends HomeState {
  final String error;
  GenerateQrImageErrorState({required this.error});
}
//GenerateQrImageLoadingState
class GenerateQrImageLoadingState extends HomeState {}
//LoadingState
class LoadingState extends HomeState {}
//emit(GetAllSchedulesForSpecificCoachSuccessState(schedules: schedules));
class GetAllSchedulesForSpecificCoachSuccessState extends HomeState {
  final List<SchedulesModel> schedules;
  GetAllSchedulesForSpecificCoachSuccessState({required this.schedules});
}
//GetAllSchedulesForSpecificCoachErrorState
class GetAllSchedulesForSpecificCoachErrorState extends HomeState {
  final String error;
  GetAllSchedulesForSpecificCoachErrorState({required this.error});
}

