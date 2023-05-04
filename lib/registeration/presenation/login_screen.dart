import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';


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
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, proceed further
                        }
                      },
                      child: Text(' تسجيل دخول'),
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
// el zmalek monsa7eb