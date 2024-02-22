import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultDialogToAskUserToExitAppOrNot {
  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data:
          Theme.of(context).copyWith(dialogBackgroundColor: Colors.white, primaryColor: Colors.white),
          child: AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,

            title: const Text(
              //arabic
              'تنبيه',
              textDirection: TextDirection.rtl,
            ),
            content: // Text('Are you sure you want to exit the app?'),
            //translate to arabic
            const Text(
              'هل انت متاكد من انك تريد الخروج من التطبيق؟',
              textDirection: TextDirection.rtl,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("الغاء", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("خروج", style: TextStyle(color: Colors.white)),
                      style:
                      ElevatedButton.styleFrom(primary: Colors.red.shade800),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
