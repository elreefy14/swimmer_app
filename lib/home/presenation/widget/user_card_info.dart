import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/Home/dash_board_cubit.dart';

class UserCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/Dashboard Card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 17.0.h),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/empty-profile.png'),
          ),
          SizedBox(height: 2.0.h),
          BlocBuilder<DashBoardCubit, DashBoardState>(
            builder: (context, state) {
              return Text(
                '${DashBoardCubit.get(context).coach?.name} ',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 19 / 16,
                  color: Color(0xFFFFFFFF),
                ),
              );
            },
          ),
          SizedBox(height: 35.0.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<DashBoardCubit, DashBoardState>(
                  builder: (context, state) {
                    return Text(
                      DashBoardCubit.get(context).firstSchedule == null
                          ? 'لا يوجد مواعيد'
                          : '${DateFormat('hh:mm a').format(DashBoardCubit.get(context).firstSchedule!.startTime!.toDate())}',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    );
                  },
                ),
                SizedBox(width: 5.0.w),
                Text(
                  'اقرب موعد'
                      '  اليوم',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    height: 14 / 12,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<DashBoardCubit, DashBoardState>(
                  builder: (context, state) {
                    return Text(
                      DashBoardCubit.get(context).coach?.hourlyRate.toString() ?? '',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    );
                  },
                ),
                SizedBox(width: 5.0.w),
                Text(
                  'السعر / الساعة ',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    height: 14 / 12,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0.h),
        ],
      ),
    );
  }
}