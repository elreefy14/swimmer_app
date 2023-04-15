// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
// import '../business_logic/auth_cubit/otp_cubit.dart';
// import 'package:youtube_apis/core/constants/font_manager.dart';
// import 'package:youtube_apis/feautres/registeration/presenation/SignUpScreen.dart';
// import '../../../core/constants/my_color.dart';
// import '../../../core/constants/styles_manager.dart';
//
// class ResetCodeScreen extends StatelessWidget {
//   //take mobile number and email and password from sign up screen
//   final String email;
//   final String phone;
//   final String password;
//   ResetCodeScreen({required this.email, required this.phone, required this.password});
//   late String otp;
//   @override
//   Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Verify Your Phome Number',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 40),
//               Text(
//                 'Enter your 6 digit Phome Number Sent to ',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey),
//               ),
//               const SizedBox(height: 40),
//               _pinCodeField(context),
//               const SizedBox(height: 40),
//               BlocConsumer<OtpCubit, OtpState>(
//                 listener: (context, state)
//                 {
//                   if (state is OtpVerified) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SignUpScreen()));
//
//
//                   }else if (state is OTPLoading) {
//                     //widget for progress indicator
//                     _showProgressIndicator(context);
//                   }
//
//                 },
//              builder: (context, state) {
//                return defaultButton(
//                   function: () {
//                     OtpCubit.get(context).otpSubmitted(otp);
//                   showToast(state: ToastStates.ERROR, msg: 'uncorrect code');
//                   },
//                   text: 'Next',
//                   radius: 30,
//                   isUpperCase: false);
//   },
// ),
//                SizedBox(
//                 height: height * 0.04,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Didn\'t Receive? ',
//                     style: getMediumStyle(color: Colors.black, fontSize: FontSizeManager.s18),
//                   ),
//                   TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Click Here',
//                         style: getBoldStyle(color: mainColor, fontSize: FontSizeManager.s30),
//                         ),
//                       ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.04,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _pinCodeField(context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height / 7,
//       child: PinCodeTextField(
//         animationType: AnimationType.slide,
//         animationCurve: Curves.linear,
//         length: 6,
//         onChanged: (String otp) {
//           print('otp value is $otp');
//           this.otp=otp;
//         },
//         appContext: context,
//       ),
//     );
//   }
//   Widget _showProgressIndicator(BuildContext context) {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }