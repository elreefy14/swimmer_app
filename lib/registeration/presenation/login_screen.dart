import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';
import 'package:swimmer_app/registeration/presenation/widget/login_button.dart';
import 'package:swimmer_app/registeration/presenation/widget/login_title.dart';

import '../../core/helpers/spacing.dart';
//SizedBox verticalSpace(double height) => SizedBox(
//       height: height.h,
//     );
//
// SizedBox horizontalSpace(double width) => SizedBox(
//       width: width.w,
//     );
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
            LoginTitle(),
          //SizedBox(height: 120.0.h),
                 verticalSpace(120.0),
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
                 // SizedBox(height: 20.0.h),
                  verticalSpace(20.0.h),
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
                  // SizedBox(height: 20.h),
                  verticalSpace(20.0.h),
                  RegisterationButton(),

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