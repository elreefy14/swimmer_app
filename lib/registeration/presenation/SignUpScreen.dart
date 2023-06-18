import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/constants/routes_manager.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/otp_cubit.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/sign_up_cubit.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/sign_up_state.dart';
import 'package:swimmer_app/registeration/presenation/otp.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';

import '../../core/constants/font_manager.dart';
import '../../core/constants/styles_manager.dart';
import '../../home/presenation/widget/widget.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(
            top: 62.0.h,
           // horizontal: 145.w,
          ),
          child: Text(
            'تسجيل',
            style: getBoldStyle(fontSize: FontSizeManager.s32, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        // Text(
        //   'التسجيل',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontSize: 24.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(height: 50.0.h),
        Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                  child: BuildTextFormField('الاسم الاول14', firstNameController,TextInputType.name, 'ادخل الاسم الاول', (value) {
      if (value!.isEmpty) {
        return ' الرجاء ادخال الاسم الاول';
      }
      return null;
    },Icons.person),
                ),
                SizedBox(height: 5.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                  child: BuildTextFormField('الاسم الاخير', lastNameController, TextInputType.name,'ادخل الاسم الاخير', (value) {
      if (value!.isEmpty) {
        return 'الرجاء ادخال الاسم الاخير';
      }
      return null;
    },Icons.person),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                  child: BuildTextFormField('رقم الهاتف', phoneController, TextInputType.phone,'ادخل رقم الهاتف', (value) {
      if (value!.isEmpty) {
        return 'الرجاء ادخال رقم الهاتف';
      }
      return null;
    },Icons.phone,),
                ),
                SizedBox(height: 5.0.h),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                     child: BuildTextFormField('كلمة المرور', passwordController,TextInputType.text, 'ادخل كلمة المرور', (value) {
      if (value!.isEmpty) {
        return 'الرجاء ادخال كلمة المرور';
      }
      else if (value.length < 6) {
    return 'يجب ادخال كلمة مرور اكثر من ٦ أحرف او ارقام';
    }
      return null;
    },Icons.lock, ),
                   ),
            //    SizedBox(height: 20.0.h),
                BlocConsumer<OtpCubit,OtpState >(
  listener: (context, state) {
    if (state is PhoneNumberSubmittedloaded) {
    Navigator.pushNamed(
            context,
            AppRoutes.otpVerification,
            arguments: {
              'phone': phoneController.text,
              'lName': lastNameController.text,
              'fName': firstNameController.text,
              'password': passwordController.text,
            },
          );
    }


  },
  builder: (context, state) {
    return ConditionalBuilder(
    condition: state is! SignUpLoadingState,
    builder: (context) {
    return Padding(
      padding: EdgeInsets.symmetric(
         horizontal: 31.w,
         vertical: 20.h
      ),
      child: ElevatedButton(

        onPressed: () {
          if (_formKey.currentState!.validate()) {
         OtpCubit.get(context).phoneNumberSubmitted(phoneController.text);
            // Navigator.pushNamed(
            //   context,
            //   AppRoutes.otpVerification,
            //   arguments: {
            //     'phone': phoneController.text,
            //     'lName': lastNameController.text,
            //     'fName': firstNameController.text,
            //     'password': passwordController.text,
            //   },
            // );
          }
        },
        child: Text('تسجيل'),
      ),
    );

    },
    fallback: (context) {
    return Center(
      child: CircularProgressIndicator(),
    );
    },
    );


  },
),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}}
