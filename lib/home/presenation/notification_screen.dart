
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    itemBuilder:(context, index) {
    if(state is GetNotificationsLoadingState)
    return Center(child: CircularProgressIndicator());
    else if(state is GetNotificationsSuccessState)
    {
    var schedule = state.notifications[index];
    return Row(
    children: [
      ImageIcon(
        AssetImage('assets/images/notification.png'),
        color: Color(0xFF000000),
        size: 16,
      ),

    ],
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
    itemCount: state is GetNotificationsSuccessState ? state.notifications.length : 0,
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
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(

                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                                  child: Container(

                                    decoration: ShapeDecoration(
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
                                SizedBox(height: 5.h),
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:EdgeInsets.symmetric(horizontal: 30.w),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    ' قمت باعادة تعيين كلمة المرور',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Color(0xFF333333),
                                                      fontSize: 12,
                                                      fontFamily: 'IBM Plex Sans Arabic',
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                   SizedBox(width: 5.w),
                                                  // Container(
                                                  //   width: 16,
                                                  //   height: 16,
                                                  //   clipBehavior: Clip.antiAlias,
                                                  //   decoration: BoxDecoration(),
                                                  //   child: Stack(children: [
                                                  //       ,
                                                  //       ]),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 5.h),
                                      Container(
                                        padding:  EdgeInsets.symmetric(horizontal: 55.w),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '14 نيسان',
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 5),
                          SizedBox(height: 5.h),
                          Container(

                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                                  child: Container(
                                    width: 390,
                                    decoration: ShapeDecoration(
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
                                const SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  height: 38,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 30),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'قمت بتغيير الاسم الاخير',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Color(0xFF333333),
                                                      fontSize: 12,
                                                      fontFamily: 'IBM Plex Sans Arabic',
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  // Container(
                                                  //   width: 16,
                                                  //   height: 16,
                                                  //   clipBehavior: Clip.antiAlias,
                                                  //   decoration: BoxDecoration(),
                                                  //   child: Stack(children: [
                                                  //       ,
                                                  //       ]),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 55),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1 نيسان',
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


          ],
        ),
      ),
    ],
    );
  }
}



