import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/helpers/spacing.dart';
import 'package:swimmer_app/home/presenation/widget/custom_app_bar.dart';
import 'package:swimmer_app/home/presenation/widget/notificatio_list.dart';
import '../../core/theming/styles.dart';
class NotificationScreen extends StatelessWidget {
 // const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        text: 'الاشعارات',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50.h),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                               Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    //last 24 hours
                                    'اليوم',
                                    textAlign: TextAlign.right,
                                    style:
                                    TextStyles.font24Weight400ColorMyBlack.copyWith(
                                      fontWeight: FontWeight.w300,
                                    )
                                  ),
                                ],
                              ),
                     //         SizedBox(height: 15.h),
                            verticalSpace(15),
NotificationList(
  query: FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notifications')
      .where('timestamp',
      isGreaterThan: DateTime.now()
          .subtract(const Duration(days: 1)))
      .orderBy('timestamp', descending: true),
),
                            ],
                          ),
                        ),
                      //  SizedBox(height: 23.h),
                        verticalSpace(23),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    //last 24 hours
                                      'سابقا',
                                      textAlign: TextAlign.right,
                                      style:
                                      TextStyles.font24Weight400ColorMyBlack.copyWith(
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                              //         SizedBox(height: 15.h),
                              verticalSpace(15),
                              NotificationList(
                                query:
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .collection('notifications')
                                    .where('timestamp',
                                    isLessThan: DateTime.now()
                                        .subtract(const Duration(days: 1)))
                                    .orderBy('timestamp', descending: true),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(3.14),
                              child: Container(
                                decoration: const ShapeDecoration(
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
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(3.14),
                              child: Container(
                                decoration: const ShapeDecoration(
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
                        verticalSpace(50),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

