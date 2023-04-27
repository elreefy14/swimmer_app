import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swimmer_app/registeration/presenation/widget/widget.dart';

import '../../../core/constants/routes_manager.dart';
import '../../../core/constants/styles_manager.dart';
import '../business_logic/auth_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              msg: state.error,
              state: ToastStates.ERROR,
            );
          }else if(state is LoginSuccessState){
            showToast(
              msg: 'Login Success',
              state: ToastStates.SUCCESS,
            );
            //pushnamed to zoom
            Navigator.pushNamed(context, AppRoutes.zoom);

          }
        },
        builder: (context, state) {
          var height = MediaQuery.of(context).size.height;
          //width of the screen
          var width = MediaQuery.of(context).size.width;
          return Scaffold(
            body: Form(
              key: loginFormKey,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:height*0.031,
                    ),
                    Text(
                      'Sign In',
                      style: getMediumStyle(color: Colors.black, fontSize: 30),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Add your details to Sign in',
                      style: getMediumStyle(color: Colors.grey, fontSize: 15),
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
                      label: 'Email',
                    ),
                    SizedBox(height: 20.0),
                    defaultFormField(
                      controller: passwordController,
                      isPassword: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password must not be empty';
                        }
                      },
                      label: 'Password', type: TextInputType.text
                    ),
                    SizedBox(height: 20.0),
                    if (state is LoginLoadingState)
                      CircularProgressIndicator()
                    else
//use default button here
                      defaultButton(
                          function: () {

                          if (loginFormKey.currentState!.validate()) {
                            LoginCubit.get(context).signIn(
                              phone: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                          text: 'Sign in',
                          radius: 30,
                          isUpperCase: false),
                      // if (state is LoginErrorState)
                      // Text(
                      //   state.error??'ahemd',
                      //   style: TextStyle(color: Colors.red),
                      // )
                      //,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // el zmalek 7asala
  // Reefy Fala7
}
