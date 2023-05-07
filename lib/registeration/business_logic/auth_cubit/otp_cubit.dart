import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(AuthInitial());

  static OtpCubit get(context) => BlocProvider.of(context);
  static String? verificationIdd;
  static UserCredential? user;
  late Timer _resendOtpTimer;
  int _resendOtpTimerDuration = 30;

  Future<void> phoneNumberSubmitted(String phoneNumber) async {
    emit(phoneNumberSubmittedLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: _verificationCompleted(),
      verificationFailed: _verificationFailed(),
      codeSent: await _codeSent(),
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
    );
    emit(PhoneNumberSubmittedloaded());
  }

  Future<void> otpSubmitted({required String otp}) async {
    emit(OTPLoading());
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdd!,
      smsCode: otp,
    );
    user = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    emit(OtpVerified());
  }

  _codeSent() async {
    return (String verificationId, [int? forceResendingToken]) {
      print('MY code sent');
      print(verificationId);
      print('MY TOKEN');
      print(forceResendingToken);
      verificationIdd = verificationId;
      startResendOtpTimer();
      emit(OTPSent());
    };
  }

  _verificationCompleted() {
    return (AuthCredential credential) {
      print('My verification completed');
      print(credential);
      emit(OtpVerified());
    };
  }

  _verificationFailed() {
    return (exception) {
      print('My verification failed');
      print(exception);
      emit(VerificationFailed(
        exception.message,
      //    exception.message, canResendOtp: true, resendOtpDuration: _resendOtpTimerDuration
            )
      );
    };
  }

  _codeAutoRetrievalTimeout() {
    return (String verificationId) {
      print('MY code auto retrieval timeout');
      print(verificationId);
      stopResendOtpTimer();
      emit(AuthErrorOccur('MY code auto retrieval timeout'));
    };
  }

  User getloggedInUser() {
    User user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  void startResendOtpTimer() {
    _resendOtpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendOtpTimerDuration == 0) {
        stopResendOtpTimer();
        emit(OtpVerificationFailed('', canResendOtp: true, resendOtpDuration: _resendOtpTimerDuration));
      } else {
        _resendOtpTimerDuration--;
       // emit(OtpVerificationFailed('', canResendOtp: false, resendOtpDuration: _resendOtpTimerDuration));
      }
    });
  }

  void stopResendOtpTimer() {
    _resendOtpTimer.cancel();
    _resendOtpTimerDuration = 30;
  }
//edit this code so that if time is 0 then resend otp else emit the state otpverificationfailed
  // void resendOtpCode({required phone}) async {
  //   emit(phoneNumberSubmittedLoading());
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //    // phoneNumber: '+2${user!.user!.phoneNumber}',
  //    // phoneNumber: '+201097051812',
  //     phoneNumber: '+2$phone',
  //     verificationCompleted: _verificationCompleted(),
  //     verificationFailed: _verificationFailed(),
  //     codeSent: await _codeSent(),
  //     codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
  //   );
  //   emit(OTPSent());
  // }
  void resendOtpCode({required phone}) async {
    if (_resendOtpTimerDuration == 0) {
      // Resend the OTP immediately
      emit(phoneNumberSubmittedLoading());
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2$phone',
        verificationCompleted: _verificationCompleted(),
        verificationFailed: _verificationFailed(),
        codeSent: await _codeSent(),
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
      );
      emit(OTPSent());
    } else {
      // Show the remaining time left in the resend OTP timer
      emit(OtpVerificationFailed('', canResendOtp: false, resendOtpDuration: _resendOtpTimerDuration));
    }
  }

}

//
// class OtpCubit extends Cubit<OtpState> {
//   OtpCubit() : super(AuthInitial());
//
//   static OtpCubit get(context) => BlocProvider.of(context);
//   static String? verificationIdd;
//   static UserCredential? user;
//
//   Future<void> phoneNumberSubmitted(String phoneNumber)async {
//     emit(phoneNumberSubmittedLoading());
//     print('ANA MOGOOOOOD');
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+2$phoneNumber',
//       verificationCompleted:  _verificationCompleted(),
//       verificationFailed:  _verificationFailed(),
  //     codeSent:await _codeSent(),
  //     codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
  //   );
  //   //TODO: add state for success
  //   emit(PhoneNumberSubmittedloaded());
  // }
  // Future<void> otpSubmitted (String otp) async {
  //   emit(OTPLoading());
  //   print('MY VERIFIACATION ID\n\n\n\n: $verificationIdd');
  //   final AuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: verificationIdd!,
  //     smsCode: otp,
  //   );
  //   user = await FirebaseAuth.instance.signInWithCredential(
  //     credential,
  //   );
  //   emit(OtpVerified());
  // }
  // _codeSent() async{
  //   return   (String verificationId, [int? forceResendingToken]) {
  //     print('MY code sent');
  //     print(verificationId);
  //     print('MY TOKEN');
  //     print(forceResendingToken);
  //     verificationIdd=verificationId;
  //     emit(OTPSent());
  //   };
  //
  // }
  //
  // _verificationCompleted()  {
  //   return (AuthCredential credential) {
  //     print('My verification completed');
  //     print(credential);
  //     emit(OtpVerified());
  //   };
  // }
  // _verificationFailed()  {
  //   return (exception) {
  //     print('My verification failed\n\n\n\n\n');
  //     print(exception);
  //     print('My verification failed\n\n\n\n\n');
  //
  //     emit(AuthErrorOccur(exception.message));
  //   };
  // }
  // _codeAutoRetrievalTimeout()  {
  //   return (String verificationId) {
  //     print('MY code auto retrieval timeout');
  //     print(verificationId);
  //     emit(AuthErrorOccur('MY code auto retrieval timeout'));
  //
  //   };
  // }
  // User getloggedInUser(){
  //   User user=FirebaseAuth.instance.currentUser!;
  //   return user;
  // }

//}
