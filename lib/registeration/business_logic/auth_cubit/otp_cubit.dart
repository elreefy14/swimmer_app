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

  Future<void> phoneNumberSubmitted(String phoneNumber)async {
    emit(phoneNumberSubmittedLoading());
    print('ANA MOGOOOOOD');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted:  _verificationCompleted(),
      verificationFailed:  _verificationFailed(),
      codeSent:await _codeSent(),
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
    );
    //TODO: add state for success
    emit(PhoneNumberSubmittedloaded());
  }
  Future<void> otpSubmitted (String otp) async {
    emit(OTPLoading());
    print('MY VERIFIACATION ID: $verificationIdd');
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdd!,
      smsCode: otp,
    );
    user = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    emit(OtpVerified());
  }
  _codeSent() async{
    return   (String verificationId, [int? forceResendingToken]) {
      print('MY code sent');
      print(verificationId);
      print('MY TOKEN');
      print(forceResendingToken);
      verificationIdd=verificationId;
      emit(OTPSent());
    };

  }

  _verificationCompleted()  {
    return (AuthCredential credential) {
      print('My verification completed');
      print(credential);
      emit(OtpVerified());
    };
  }
  _verificationFailed()  {
    return (exception) {
      print('My verification failed');
      print(exception);
      emit(AuthErrorOccur(exception.message));
    };
  }
  _codeAutoRetrievalTimeout()  {
    return (String verificationId) {
      print('MY code auto retrieval timeout');
      print(verificationId);
      emit(AuthErrorOccur('MY code auto retrieval timeout'));

    };
  }
  User getloggedInUser(){
    User user=FirebaseAuth.instance.currentUser!;
    return user;
  }


}
