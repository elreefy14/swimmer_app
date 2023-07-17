import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';
import 'package:swimmer_app/registeration/presenation/widget/widget.dart';

import '../../core/constants/routes_manager.dart';

class SignInScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          reverse: true,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              SizedBox(height: 45.0.h),
          Padding(
            padding: EdgeInsets.only(
              top: 82.0.h,
            ),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 32.sp,
                    height: 26.h / 32.h,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 120.0.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0.w),
            child: Form(
              key: LoginCubit.get(context).formKey,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BuildTextFormField(
                      'رقم الهاتف',
                      LoginCubit.get(context).phoneController,
                      TextInputType.phone,
                      'ادخل رقم الهاتف',
                          (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال رقم الهاتف';
                        }
                        return null;
                      },
                      'assets/images/Call.png',
                      null
                  ),
                  SizedBox(height: 20.0.h),
                  BuildTextFormField(
                      'كلمة المرور',
                      LoginCubit.get(context).passwordController,
                      TextInputType.text,
                      'ادخل كلمة المرور',
                          (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال كلمة المرور';
                        } else if (value.length < 6) {
                          return 'يجب ادخال كلمة مرور اكثر من ٦ أحرف او ارقام';
                        }
                        return null;
                      },
                      null,
                      null
                  ),
                  SizedBox(height: 20.h),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                     //   Navigator.pushNamed(context, AppRoutes.home);
                      //push with replacement
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      } else if (state is LoginErrorState) {
                        showToast(
                          msg: state.error,
                          state: ToastStates.ERROR,
                        );
                      } else if (state is LoginLoadingState) {
                        showToast(
                          msg: 'جاري تسجيل الدخول',
                          state: ToastStates.WARNING,
                        );
                      }
                    },
                    builder: (context, state) {
                      return ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 31.w,
                                right: 31.w,
                                top: 80.h
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (LoginCubit.get(context).formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    phone: LoginCubit.get(context).phoneController.text,
                                    password: LoginCubit.get(context).passwordController.text,
                                  );
                                }
                              },
                              child: Text(
                                'تسجيل دخول',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Arabic',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  height: 26.h / 18.h,
                                  color: Color(0xFFFFFFFF),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF2196F3), // Background color
                                padding: EdgeInsets.symmetric
                                  (horizontal: 16.w, vertical: 9.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18.sp, // Adjust the font size if needed
                                ),
                              ),
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
        ),
      ),
    );
  }
}