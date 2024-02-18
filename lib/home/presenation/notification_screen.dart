import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    //last 24 hours
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
                              SizedBox(height: 15.h),
                              FirestoreListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  pageSize: 5,
                                  query: FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                      .instance.currentUser?.uid)
                                      .collection('notifications')
                                      .where('timestamp',
                                      isGreaterThan: DateTime.now()
                                          .subtract(
                                          const Duration(days: 1)))
                                      .orderBy('timestamp', descending: true),
                                  emptyBuilder: (context) => Container(
                                    // padding:EdgeInsets.only(top: 6, left: 8, bottom: 6),
                                    padding: EdgeInsets.only(
                                      top: 6.h,
                                      left: 8.w,
                                      bottom: 6.h,
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'لاتوجد اشعارات اليوم',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 12,
                                            fontFamily:
                                            'IBM Plex Sans Arabic',
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (context, doc) {
                                    return Row(
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 300.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                //snapshot['message'] ?? '',
                                                doc['message'] ?? '',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 12,
                                                  fontFamily:
                                                  'IBM Plex Sans Arabic',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                //get the doc['timestamp'] which is time stamp and convert it to string
                                                //first convet it to date time
                                                //then use toIso8601String() to convert it to string
                                                '${doc['timestamp']?.toDate().toIso8601String().substring(0, 10)}',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  color: Color(0xFFB9B9B9),
                                                  fontSize: 10,
                                                  fontFamily:
                                                  'IBM Plex Sans Arabic',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        const ImageIcon(
                                          AssetImage('assets/images/icon.png'),
                                          color: Color(0xFF000000),
                                          size: 16,
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(height: 23.h),
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
                        SizedBox(height: 23.h),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.w,
                            right: 30.w,
                          ),
                          child: const Text(
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
                        SizedBox(height: 15.h),
                        FirestoreListView(
                            pageSize: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            query: FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .collection('notifications')
                            //i want to query notification which day is not today
                                .where('timestamp',
                                isLessThan: DateTime.now()
                                    .subtract(const Duration(days: 1)))
                                .orderBy('timestamp', descending: true),
                            emptyBuilder: (context) => Container(
                              // padding:EdgeInsets.only(top: 6, left: 8, bottom: 6),
                              padding: EdgeInsets.only(
                                top: 6.h,
                                left: 8.w,
                                bottom: 6.h,
                                right: 30.w,
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'لاتوجد اشعارات اليوم',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 12,
                                      fontFamily:
                                      'IBM Plex Sans Arabic',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (context, doc) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 300.w,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              //snapshot['message'] ?? '',
                                              doc['message'] ?? '',
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: 12,
                                                fontFamily:
                                                'IBM Plex Sans Arabic',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              // doc['timestamp']?.toIso8601String().substring(
                                              //   0, 10) ?? '',
                                              doc['timestamp']
                                                  ?.toDate()
                                                  .toIso8601String()
                                                  .substring(0, 10) ??
                                                  '',
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFFB9B9B9),
                                                fontSize: 10,
                                                fontFamily:
                                                'IBM Plex Sans Arabic',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      const ImageIcon(
                                        AssetImage('assets/images/icon.png'),
                                        color: Color(0xFF000000),
                                        size: 16,
                                      ),
                                    ]),
                              );
                            }),
                        SizedBox(height: 50.h),
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


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: InkWell(
        onTap: () async {
          Navigator.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/back.png',
            width: 50,
            height: 50,
            fit: BoxFit.none,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            right: 12.w,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 24,
              fontFamily: 'Montserrat-Arabic',
              fontWeight: FontWeight.w400,
              height: 0.04,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}