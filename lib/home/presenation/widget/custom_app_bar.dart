
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/core/helpers/extensions.dart';
import 'package:swimmer_app/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Text(
          text,
         // textAlign: TextAlign.center,
          style: TextStyles.font24Weight400ColorMyBlack,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}