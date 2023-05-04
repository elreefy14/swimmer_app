abstract class SocialStates {}
//InitialState
class InitialState extends SocialStates {}
//ChangePasswordVisibilityState
class ChangePasswordVisibilityState extends SocialStates {}
//SignUpLoadingState
class SignUpLoadingState extends SocialStates {}
//SignUpSuccessState
class SignUpSuccessState extends SocialStates {
  final String uId;
  SignUpSuccessState(this.uId);
}
//SignUpErrorState
class SignUpErrorState extends SocialStates {
  final String? error;
  SignUpErrorState({this.error});
}
//CreateUserLoadingState
class CreateUserLoadingState extends SocialStates {}
//CreateUserSuccessState
class CreateUserSuccessState extends SocialStates {
  final String uId;
  CreateUserSuccessState(this.uId);
}
//CreateUserErrorState
class CreateUserErrorState extends SocialStates {}
//UpdatePasswordLoadingState
class UpdatePasswordLoadingState extends SocialStates {}
//UpdatePasswordSuccessState
class UpdatePasswordSuccessState extends SocialStates {}
//UpdatePasswordErrorState
class UpdatePasswordErrorState extends SocialStates {
  final String? error;
  UpdatePasswordErrorState({this.error});
}
