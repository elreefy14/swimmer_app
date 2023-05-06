import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:swimmer_app/core/constants/routes_manager.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/otp_cubit.dart';

import '../../core/constants/my_color.dart';
import '../business_logic/auth_cubit/sign_up_cubit.dart';
import '../business_logic/auth_cubit/sign_up_state.dart';


// ignore: must_be_immutable
class OtpVerificationScreen extends StatelessWidget {
  final phoneNumber;
  final fName;
  final lName;
  final password;
  OtpVerificationScreen({
    Key? key,
    this.phoneNumber,
    this.fName,
    this.lName,
    this.password,
  }) : super(key: key);
  late String otpCode;

  Widget _buildIntroTexts() {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/opt.jpg',
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16.0),
              Text(
                'التحقق من رقم الهاتف',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'لقد ارسلنا رسالة قصيرة تحتوي علي رمز التفعيل الي الرقم ${phoneNumber}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
  }
  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline, // set the shape to underline
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: MyColors.blue,
          inactiveColor: Colors.grey,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
          activeFillColor:  Colors.white,
          inactiveFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<OtpCubit>(context).otpSubmitted(otp: otpCode).then((value) =>
    BlocProvider.of<SignUpCubit>(context).signUp(
      phone: phoneNumber,
      fName: fName,
      lName: lName,
      password: password,
    )
    );
  }

  Widget _buildVrifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);

          _login(context);
        },
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110, 50),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
//edit this code to handle that if state is  SignUpSuccessState(in signUPCubit)
  //and state is OtpVerified(in OtpCubit)
  //           Navigator.pop(context);
  //           Navigator.pushNamed(context, AppRoutes.home);
  //else show error message for sign up error
  //and navigate to sign up screen again
  Widget _buildPhoneVerificationBloc() {
    var otpVerified = false;
    var signUpSuccess = false;

    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) async {
        if (state is OtpVerified) {
          otpVerified = true;

          // If both events have occurred, navigate to the home screen
          if (signUpSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.home);
          }
        }
      },
      child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) async {
            if (state is SignUpSuccessState) {
              signUpSuccess = true;

              // If both events have occurred, navigate to the home screen
              if (otpVerified) {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.home);
              }
            } else if (state is SignUpErrorState) {
              // If there is an error, show a toast
              // and navigate to the sign up screen again
              if (otpVerified) {
                Navigator.pop(context);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error ??
                      'An error occurred while signing up. Please try again.'),
                ),
              );
              Navigator.pushNamed(context, AppRoutes.signUp);
            }
          },
          child: Container()// your existing child widget here
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildIntroTexts(),
                SizedBox(
                  height: 88,
                ),
                _buildPinCodeFields(context),
                SizedBox(
                  height: 60,
                ),
                _buildVrifyButton(context),
                _buildPhoneVerificationBloc(),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الم تستلم رمز التفعيل؟',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'اعادة الارسال',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:swimmer_app/registeration/business_logic/auth_cubit/otp_cubit.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   final String phoneNumber;
//   final String fName;
//   final String lName;
//   final String password;
//
//   OtpVerificationScreen(
//       { required this.phoneNumber, required this.fName, required this.lName, required this.password});
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//
//   final firstDigitFocusNode = FocusNode();
//   final secondDigitFocusNode = FocusNode();
//   final thirdDigitFocusNode = FocusNode();
//   final fourthDigitFocusNode = FocusNode();
//
//   @override
//   void dispose() {
//     firstDigitFocusNode.dispose();
//     secondDigitFocusNode.dispose();
//     thirdDigitFocusNode.dispose();
//     fourthDigitFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset(
//                 'assets/images/opt.jpg',
//                 height: 200,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'التحقق من رقم الهاتف',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'لقد ارسلنا رسالة قصيرة تحتوي علي رمز التفعيل الي الرقم ${widget
//                     .phoneNumber}',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 32.0),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         decoration: InputDecoration(
//                           border: UnderlineInputBorder(),
//                           counterText: '',
//                         ),
//                         focusNode: firstDigitFocusNode,
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             secondDigitFocusNode.requestFocus();
//                           }
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Expanded(
//                       child: TextField(
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         decoration: InputDecoration(
//                           border: UnderlineInputBorder(),
//                           counterText: '',
//                         ),
//                         focusNode: secondDigitFocusNode,
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             thirdDigitFocusNode.requestFocus();
//                           } else {
//                             firstDigitFocusNode.requestFocus();
//                           }
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Expanded(
//                       child: TextField(
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         decoration: InputDecoration(
//                           border: UnderlineInputBorder(),
//                           counterText: '',
//                         ),
//                         focusNode: thirdDigitFocusNode,
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             fourthDigitFocusNode.requestFocus();
//                           } else {
//                             secondDigitFocusNode.requestFocus();
//                           }
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     BlocConsumer<OtpCubit, OtpState>(
//                       listener: (context, state) {
//                         // TODO: implement listener
//                       },
//                       builder: (context, state) {
//                         return Expanded(
//                           child: TextField(
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               border: UnderlineInputBorder(),
//                               counterText: '',
//                             ),
//                             focusNode: fourthDigitFocusNode,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 OtpCubit.get(context)
//                                     .otpSubmitted(otp: value );
//                               } else {
//                                 thirdDigitFocusNode.requestFocus();
//                               }
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 32.0),
//               Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'الم تستلم رمز التفعيل؟',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     SizedBox(width: 8.0),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'اعادة الارسال',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.lightBlueAccent,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//
//
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget _pinCodeField(context) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height / 7,
//     child: PinCodeTextField(
//       animationType: AnimationType.slide,
//       animationCurve: Curves.linear,
//       length: 6,
//       onChanged: (String otp) {
//         print('otp value is $otp');
//         this.otp=otp;
//       },
//       appContext: context,
//     ),
//   );
// }
// Widget _showProgressIndicator(BuildContext context) {
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }
// }