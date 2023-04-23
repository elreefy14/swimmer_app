import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/registeration/presenation/widget/widget.dart';
import '../../../core/constants/font_manager.dart';
import '../../../core/constants/styles_manager.dart';
import '../business_logic/auth_cubit/sign_up_cubit.dart';
import '../business_logic/auth_cubit/sign_up_state.dart';
import '../business_logic/auth_cubit/otp_cubit.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SocialStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            //use push named and go to route :approutes.zoom
         //TODO: make navigation
            //   Navigator.pushNamed(context, AppRoutes.login);
          } else if (state is SignUpErrorState) {
            showToast(
              msg: state.error ?? 'Error',
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          //height of the screen
          var height = MediaQuery.of(context).size.height;
          //width of the screen
          var width = MediaQuery.of(context).size.width;
          return Scaffold(
            body: Form(
              key: signUpFormKey,
              child: Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  padding: EdgeInsets.only(top: height * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.031,
                      ),
                      Text(
                        'Sign Up',
                     style: getBoldStyle(fontSize: FontSizeManager.s30, color: Colors.black),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Add your details to Sign Up',
                        style: getRegularStyle(fontSize: FontSizeManager.s16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email must not be empty';
                            }
                          },
                          label: 'Email Address',
                          radius: 30.r),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Mobile No must not be empty';
                            }
                          },
                          label: 'Mobile No',
                          radius: 30.r),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty';
                            }
                          },
                          label: 'Password',
                          radius: 30.r),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultFormField(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a confirm password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          label: 'Confirm Password',
                          radius: 30.r),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      //elevated button

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
