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



