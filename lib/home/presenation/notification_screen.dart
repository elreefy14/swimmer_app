
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/home/data/Notification.dart';

import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HomeCubit.get(context).getNotifications();
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(

                padding: EdgeInsets.only(top: 50.h),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'اليوم',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 20,
                                          fontFamily: 'Montserrat-Arabic',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 15.h),
                               BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
          // TODO: implement listener
  },
  builder: (context, state) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
      //   physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
          if (state is GetNotificationsLoadingState)
            return Center(child: CircularProgressIndicator());
          else if (state is GetNotificationsSuccessState || HomeCubit
              .get(context)
              .todayNotifications
              .length > 0) {
            NotificationModel notifications = HomeCubit
                .get(context)
                .todayNotifications[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      notifications.message ?? '',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      //i want to get only day from timestamp
                      notifications.timestamp?.toIso8601String().substring(
                          0, 10) ?? '',
                      //  notifications.timestamp?.toIso8601String().substring(11,16)??'',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 10,
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.w),
                ImageIcon(
                  AssetImage('assets/images/icon.png'),
                  color: Color(0xFF000000),
                  size: 16,
                ),

              ],
            );
          }
          else
            return Container(
              // padding:EdgeInsets.only(top: 6, left: 8, bottom: 6),
              padding: EdgeInsets.only(
                top: 6.h,
                left: 8.w,
                bottom: 6.h,
              ),


              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'لاتوجد اشعارات اليوم',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            );
      },
      itemCount: HomeCubit
            .get(context)
            .todayNotifications
            .length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  },
),

                              ],
                            ),
                          ),
                         SizedBox(height: 23.h),
                          Container(

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                                  child: Container(

                                    decoration: ShapeDecoration(
                                      color: Color(0xFFB9B9B9),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Color(0xFFF3F3F3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                             SizedBox(height: 10.h),
                          Container(

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                                  child: Container(

                                    decoration: ShapeDecoration(
                                      color: Color(0xFFB9B9B9),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Color(0xFFF3F3F3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(height: 23.h),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.w,
                              right: 30.w,
                            ),
                            child: Container(
                              child: Text(
                                'سابقا',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontFamily: 'Montserrat-Arabic',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                           SizedBox(height: 15.h),
                          BlocConsumer<HomeCubit, HomeState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
                                //   physics: NeverScrollableScrollPhysics(),
                                itemBuilder:(context, index) {
                                  if(state is GetNotificationsLoadingState)
                                    return Center(child: CircularProgressIndicator());
                                  else if(state is GetNotificationsSuccessState || HomeCubit.get(context).oldNotifications.length >0)
                                  {

                                    NotificationModel notifications = HomeCubit.get(context).oldNotifications[index] ;
                                    return Padding(

                                      padding: EdgeInsets.only(
                                        left: 30.w,
                                        right: 30.w,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                notifications.message??'',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 12,
                                                  fontFamily: 'IBM Plex Sans Arabic',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                //i want to get only day from timestamp
                                                notifications.timestamp?.toIso8601String().substring(0,10)??'',
                                                //  notifications.timestamp?.toIso8601String().substring(11,16)??'',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFFB9B9B9),
                                                  fontSize: 10,
                                                  fontFamily: 'IBM Plex Sans Arabic',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 5.w),
                                          ImageIcon(
                                            AssetImage('assets/images/icon.png'),
                                            color: Color(0xFF000000),
                                            size: 16,
                                          ),

                                        ],
                                      ),
                                    );
                                  }
                                  else
                                    return  Container(
                                      // padding:EdgeInsets.only(top: 6, left: 8, bottom: 6),
                                      padding: EdgeInsets.only(
                                        top: 6.h,
                                        left: 8.w,
                                        bottom: 6.h,
                                      ),


                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'لاتوجد اشعارات اليوم',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 12,
                                              fontFamily: 'IBM Plex Sans Arabic',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ) ;
                                },
                                itemCount: HomeCubit.get(context).oldNotifications.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),


                ],
              ),
            ),
          ],
          ),
        );
      }
    );
  }
}



