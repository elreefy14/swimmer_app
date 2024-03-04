import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}