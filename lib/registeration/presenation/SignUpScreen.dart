import 'package:flutter/material.dart';
import 'package:swimmer_app/registeration/presenation/otp.dart';
import 'package:swimmer_app/registeration/presenation/widget/component.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
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
              'التسجيل',
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
                    BuildTextFormField('الاسم الاول', firstNameController,TextInputType.name, 'ادخل الاسم الاول', (value) {
          if (value!.isEmpty) {
            return 'الرجاء ادخال الاسم الاول';
          }
          return null;
        },Icons.person),
                    SizedBox(height: 5.0),
                    BuildTextFormField('الاسم الاخير', lastNameController, TextInputType.name,'ادخل الاسم الاخير', (value) {
          if (value!.isEmpty) {
            return 'الرجاء ادخال الاسم الاخير';
          }
          return null;
        },Icons.person),
                    SizedBox(height: 5.0),
                    BuildTextFormField('رقم الهاتف', phoneController, TextInputType.phone,'ادخل رقم الهاتف', (value) {
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
          else if (value.length < 6) {
      return 'يجب ادخال كلمة مرور اكثر من ٦ أحرف او ارقام';
    }
          return null;
        },Icons.lock, ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpVerificationScreen(phoneNumber:phoneController.text ,)),
    );
                        }
                      },
                      child: Text('تسجيل'),
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
