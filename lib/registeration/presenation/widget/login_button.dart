import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/helpers/extensions.dart';
import 'package:swimmer_app/registeration/presenation/widget/widget.dart';

import '../../../core/routing/routes_manager.dart';
import '../../business_logic/auth_cubit/login_cubit.dart';

class RegisterationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushReplacementNamed(AppRoutes.home);
        } else if (state is LoginErrorState) {
          showToast(
            msg: state.error,
            state: ToastStates.ERROR,
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
                  backgroundColor: Color(0xFF2196F3), // Background color
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
    );
  }
}