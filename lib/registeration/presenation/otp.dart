import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  OtpVerificationScreen({required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  
final firstDigitFocusNode = FocusNode();
final secondDigitFocusNode = FocusNode();
final thirdDigitFocusNode = FocusNode();
final fourthDigitFocusNode = FocusNode();

@override
void dispose() {
  firstDigitFocusNode.dispose();
  secondDigitFocusNode.dispose();
  thirdDigitFocusNode.dispose();
  fourthDigitFocusNode.dispose();
  super.dispose();
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/opt.jpg',
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Text(
              'التحقق من رقم الهاتف',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 16.0),
              Text(
                'لقد ارسلنا رسالة قصيرة تحتوي علي رمز التفعيل الي الرقم ${widget.phoneNumber}',
            style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
               ),
               textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        counterText: '',
                      ),
                      focusNode: firstDigitFocusNode,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          secondDigitFocusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        counterText: '',
                      ),
                      focusNode: secondDigitFocusNode,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          thirdDigitFocusNode.requestFocus();
                        } else {
                          firstDigitFocusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        counterText: '',
                      ),
                      focusNode: thirdDigitFocusNode,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          fourthDigitFocusNode.requestFocus();
                        } else {
                          secondDigitFocusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        counterText: '',
                      ),
                      focusNode: fourthDigitFocusNode,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          thirdDigitFocusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 32.0),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الم تستلم رمز التفعيل؟',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'اعادة الارسال',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          
        
      
          
        ),
      ),
    ),
  );
}}