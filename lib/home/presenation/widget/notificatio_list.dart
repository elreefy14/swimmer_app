import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';

class NotificationList extends StatelessWidget {
  final Query query;

  NotificationList({required this.query});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      pageSize: 5,
      query: query,
      emptyBuilder: (context) => Container(
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
              //textAlign: TextAlign.right,
              style: TextStyles.font12Weight300ColorMyBlack,
            ),
          ],
        ),
      ),
      itemBuilder: (context, doc) {
        return Row(
          children: [
            SizedBox(
              width: 300.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    doc['message'] ?? '',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    '${doc['timestamp']?.toDate().toIso8601String().substring(0, 10)}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFFB9B9B9),
                      fontSize: 10,
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
           // SizedBox(width: 5.w),
            horizontalSpace(5),
            const ImageIcon(
              AssetImage('assets/images/icon.png'),
              color: Color(0xFF000000),
              size: 16,
            ),
          ],
        );
      },
    );
  }
}