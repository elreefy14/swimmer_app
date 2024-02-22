import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class ToatalHoursAndSalary extends StatelessWidget {
  final String totalSalary;
  final String totalHours;

  ToatalHoursAndSalary({required this.totalSalary, required this.totalHours});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 110.0.w,
          height: 50.0.h,
          decoration: BoxDecoration(
            color: Color(0xFF2196F3),
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          child: Center(
            child: Text(
              totalSalary + ' ج',
              style: TextStyles.font15Weight300ColorWhite,
            ),
          ),
        ),
        SizedBox(width: 15.0.w),
        Container(
          width: 110.0.w,
          height: 50.0.h,
          decoration: BoxDecoration(
            color: Color(0xFF2196F3),
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          child: Center(
            child: Text(
              totalHours + ' ساعة',
              style: TextStyles.font15Weight300ColorWhite,
            ),
          ),
        ),
      ],
    );
  }
}