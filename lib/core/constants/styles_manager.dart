import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontFamilyNames.messiriFont,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}



//* regular
TextStyle getRegularStyle(
    {required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

//* medium
TextStyle getMediumStyle(
    {required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

//* semiBold 20
TextStyle getSemiBoldStyle(
    {required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

//* Bold 24
TextStyle getBoldStyle(
    {required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
