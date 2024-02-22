import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/home/presenation/widget/schedule_list.dart';
import 'package:swimmer_app/home/presenation/widget/user_card_info.dart';
import 'package:swimmer_app/home/presenation/widget/user_total_housrs_and_salary.dart';
import '../../core/helpers/spacing.dart';
import '../../core/theming/styles.dart';
import '../business_logic/Home/dash_board_cubit.dart';
class DashBoardScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

        return  BlocBuilder<DashBoardCubit, DashBoardState>(
  builder: (context, state) {
    return ConditionalBuilder(
          builder: (context) =>  Column(
            children: [
              //container with height 100
              UserCardInfo(),
              verticalSpace(20),
              Text(
                'هذا الشهر',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 21 / 18,
                  color: Color(0xFF333333),
                ),
              ),
              verticalSpace(15),
              ToatalHoursAndSalary(
                totalSalary: DashBoardCubit.get(context).coach!.totalSalary.toString(),
                totalHours: DashBoardCubit.get(context).coach!.totalHours.toString(),
              ),
              verticalSpace(40),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text(
                      'ساعات العمل',
                      style: TextStyles.font12Weight300ColorMyBlack.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 19 / 16,
                      ),
                    ),
                  ],
                ),
              ),
              SchedulesList(),
            ],
          ),
          condition: DashBoardCubit.get(context).coach?.name != null ||  DashBoardCubit.get(context).coach?.hourlyRate != null
        ||state is GetUserDataSuccessState,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),

        );
  },
);
          }

  }
