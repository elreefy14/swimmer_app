part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class AuthInitial extends OtpState {}
class phoneNumberSubmittedLoading extends OtpState {}
class AuthErrorOccur extends OtpState {
  final String error;
  AuthErrorOccur(this.error);
}
class PhoneNumberSubmittedloaded extends OtpState {}
class OtpVerified extends OtpState {}
class OTPLoading extends OtpState {}
 class OTPSent extends OtpState {}
//AuthLoading
class AuthLoading extends OtpState {}
//AuthSuccess
class AuthSuccess extends OtpState {
 // final RegisterationResponse? response;
  //AuthSuccess(this.response);
}
//AuthError
class AuthError extends OtpState {
  final String? error;
  AuthError(this.error);
}
