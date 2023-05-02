part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
//LoginLoadingState
class LoginLoadingState extends LoginState {}
//LoginSuccessState
class LoginSuccessState extends LoginState {
  final String uId;
  LoginSuccessState(this.uId);
}
//LoginErrorState
class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
//LoginGoogleUserSuccessState
class LoginGoogleUserSuccessState extends LoginState {
  final String uId;
  LoginGoogleUserSuccessState(this.uId);
}
//LoginGoogleUserErrorState
class LoginGoogleUserErrorState extends LoginState {}
//LoginFacebookUserSuccessState
class LoginFacebookUserSuccessState extends LoginState {
  final String uId;
  LoginFacebookUserSuccessState(this.uId);
}
//LoginGoogleUserLoadingState
class LoginGoogleUserLoadingState extends LoginState {}
//LoginFacebookUserLoadingState
class LoginFacebookUserLoadingState extends LoginState {}
//CreateGoogleUserSuccessState
class CreateGoogleUserSuccessState extends LoginState {
  final String uId;
  CreateGoogleUserSuccessState(this.uId);
}
//CreateGoogleUserErrorState
class CreateGoogleUserErrorState extends LoginState {}
//ChangeSuffixIconState
class ChangeSuffixIconState extends LoginState {}
//EditUserDataLoadingState
class EditUserDataLoadingState extends LoginState {}
//EditUserDataSuccessState
class EditUserDataSuccessState extends LoginState {}
//EditUserDataErrorState
class EditUserDataErrorState extends LoginState {
  final String error;
  EditUserDataErrorState(this.error);
}
//UploadProfilePicSuccessState
class UploadProfilePicSuccessState extends LoginState {}
//UploadProfilePicErrorState
class UploadProfilePicErrorState extends LoginState {}
//GetProfilePicSuccessState
class GetProfilePicSuccessState extends LoginState {}
//GetProfilePicErrorState
class GetProfilePicErrorState extends LoginState {}