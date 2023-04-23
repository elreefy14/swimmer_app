import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/auth_cubit/otp_cubit.dart';
import '../../../core/constants/my_color.dart';
import '../../../core/constants/styles_manager.dart';

class ResetCodeScreen extends StatelessWidget {
  //take mobile number and email and password from sign up screen
  // final String email;
  // final String phone;
  // final String password;
  // ResetCodeScreen({required this.email, required this.phone, required this.password});
  // late String otp;
  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return BlocConsumer<OtpCubit, OtpState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
             appBar: AppBar(
               backgroundColor: Colors.white,
               elevation: 0,
               leading: IconButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 icon: Icon(
                   Icons.arrow_back_ios,
                   color: Colors.black,
                 ),
               ),
             ),
    );
  },
);
  }
}