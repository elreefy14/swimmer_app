import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';

import '../../core/constants/routes_manager.dart';
import '../../home/presenation/widget/widget.dart';


class SignInScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' تسجيل دخول',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80.0),
            Form(
              key: _formKey,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildTextFormField('رقم الهاتف', phoneController,TextInputType.phone, 'ادخل رقم الهاتف', (value) {
          if (value!.isEmpty) {
            return 'الرجاء ادخال رقم الهاتف';
          }
          return null;
        },Icons.phone,),
                    SizedBox(height: 5.0),
                       BuildTextFormField('كلمة المرور', passwordController,TextInputType.text, 'ادخل كلمة المرور', (value) {
          if (value!.isEmpty) {
            return 'الرجاء ادخال كلمة المرور';
          }
          return null;
        },Icons.password,),
                    SizedBox(height: 20.0),
                    BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {

    if (state is LoginSuccessState) {

      Navigator.pushNamed(context, AppRoutes.home);
    }else if (state is LoginErrorState) {
      showToast(
        msg: state.error,
        state: ToastStates.ERROR,
      );
    }else if (state is LoginLoadingState) {
      showToast(
        msg: 'جاري تسجيل الدخول',
        state: ToastStates.WARNING,
      );
    }
  },
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                LoginCubit.get(context).signIn(
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: Text(' تسجيل دخول'),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
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
}}
