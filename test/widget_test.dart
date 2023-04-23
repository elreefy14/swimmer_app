// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:swimmer_app/registeration/business_logic/auth_cubit/otp_cubit.dart';
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}
//
// class MockUserCredential extends Mock implements UserCredential {}
//
// void main() {
//   late FirebaseAuth firebaseAuth;
//   late OtpCubit otpCubit;
//
//   setUp(() {
//     firebaseAuth = MockFirebaseAuth();
//     otpCubit = OtpCubit();
//   });
//
//   tearDown(() {
//     otpCubit.close();
//   });
//
//   group('PhoneNumberSubmitted', () {
//     final phoneNumber = '123456789';
//
//     test('emits OTPSent on successful phone number submission', () async {
//       final mockVerificationId = 'mock_verification_id';
//       final mockAuthCredential = MockPhoneAuthCredential();
//       when(() => firebaseAuth.verifyPhoneNumber(
//         phoneNumber: '+2$phoneNumber',
//         verificationCompleted: any(named: 'verificationCompleted'),
//         verificationFailed: any(named: 'verificationFailed'),
//         codeSent: any(named: 'codeSent'),
//         codeAutoRetrievalTimeout: any(named: 'codeAutoRetrievalTimeout'),
//       )).thenAnswer((_) async => mockVerificationId);
//       when(() => mockAuthCredential.smsCode).thenReturn('123456');
//       when(() => firebaseAuth.signInWithCredential(any()))
//           .thenAnswer((_) async => MockUserCredential());
//
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           PhoneNumberSubmittedLoading(),
//           OTPSent(),
//         ]),
//       );
//
//       await otpCubit.phoneNumberSubmitted(phoneNumber);
//     });
//
//     test('emits AuthErrorOccur on phone number submission error', () async {
//       final mockException = FirebaseAuthException(
//         code: 'error_code',
//         message: 'error_message',
//       );
//       when(() => firebaseAuth.verifyPhoneNumber(
//         phoneNumber: '+2$phoneNumber',
//         verificationCompleted: any(named: 'verificationCompleted'),
//         verificationFailed: any(named: 'verificationFailed'),
//         codeSent: any(named: 'codeSent'),
//         codeAutoRetrievalTimeout: any(named: 'codeAutoRetrievalTimeout'),
//       )).thenThrow(mockException);
//
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           PhoneNumberSubmittedLoading(),
//           AuthErrorOccur(mockException.message),
//         ]),
//       );
//
//       await otpCubit.phoneNumberSubmitted(phoneNumber);
//     });
//   });
//
//   group('OtpSubmitted', () {
//     final otp = '123456';
//
//     test('emits OtpVerified on successful OTP submission', () async {
//       otpCubit.verificationIdd = 'mock_verification_id';
//       when(() => firebaseAuth.signInWithCredential(any()))
//           .thenAnswer((_) async => MockUserCredential());
//
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           OTPLoading(),
//           OtpVerified(),
//         ]),
//       );
//
//       await otpCubit.otpSubmitted(otp);
//     });
//
//     test('emits AuthErrorOccur on OTP submission error', () async {
//       final mockException = FirebaseAuthException(
//         code: 'error_code',
//         message: 'error_message',
//       );
//       otpCubit.verificationIdd = 'mock_verification_id';
//       when(() => firebaseAuth.signInWithCredential(any()))
//           .thenThrow(mockException);
//
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           OTPLoading(),
//           AuthErrorOccur(mockException.message),
//         ]),
//       );
//
//       await otpCubit.otpSubmitted(otp);
//     });
//   });
//
//   group('Resend OTP', () {
//     final mockVerificationId = 'mock_verification_id';
//     final mockAuthCredential = MockPhoneAuthCredential();
//     when(() => firebaseAuth.verifyPhoneNumber(
//       phoneNumber: any(named: 'phoneNumber'),
//       verificationCompleted: any(named: 'verificationCompleted'),
//       verificationFailed: any(named: 'verificationFailed'),
//       codeSent: any(named: 'codeSent'),
//       codeAutoRetrievalTimeout: any(named: 'codeAutoRetrievalTimeout'),
//     )).thenAnswer((_) async => mockVerificationId);
//     when(() => mockAuthCredential.smsCode).thenReturn('123456');
//     when(() => firebaseAuth.signInWithCredential(any()))
//         .thenAnswer((_) async => MockUserCredential());
//
//     test('emits OTPSent on successful resend', () async {
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           ResendOTPLoading(),
//           OTPSent(),
//         ]),
//       );
//
//       await otpCubit.resendOTP();
//     });
//
//     test('emits AuthErrorOccur on resend error', () async {
//       final mockException = FirebaseAuthException(
//         code: 'error_code',
//         message: 'error_message',
//       );
//       when(() => firebaseAuth.verifyPhoneNumber(
//         phoneNumber: any(named: 'phoneNumber'),
//         verificationCompleted: any(named: 'verificationCompleted'),
//         verificationFailed: any(named: 'verificationFailed'),
//         codeSent: any(named: 'codeSent'),
//         codeAutoRetrievalTimeout: any(named: 'codeAutoRetrievalTimeout'),
//       )).thenThrow(mockException);
//
//       await expectLater(
//         otpCubit.stream,
//         emitsInOrder([
//           ResendOTPLoading(),
//           AuthErrorOccur(mockException.message),
//         ]),
//       );
//
//       await otpCubit.resendOTP();
//     });
//   });
// }