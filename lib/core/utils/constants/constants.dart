import 'package:flutter/material.dart';

double deviceWidth = 0;
double deviceHeight = 0;
double deviceAverageSize = 0;

double textSizeBig = 0.04;
double textSizeMediumBig = 0.028;
double textSizeSmall = 0.02;
double textSizeRegular = 0.024;

final BoxShadow boxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.1),
  spreadRadius: 3,
  blurRadius: 5,
  offset: const Offset(0, 3),
);

TextStyle commonTextStyle(
    {FontWeight? fontWeight, double? fontSize, Color? textColor}) {
  return TextStyle(
    color: textColor ?? Colors.white,
    fontSize: deviceAverageSize * (fontSize ?? textSizeRegular),
    decoration: TextDecoration.none,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

class Constants {
  static const String someThingWentWrong = 'Something went wrong';
  static const String noInternet = 'No Internet';

}
