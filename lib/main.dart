import 'package:flutter/material.dart';
import 'bottom_nav.dart';

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
    color: textColor ?? Colors.black,
    fontSize: deviceAverageSize * (fontSize ?? textSizeRegular),
    decoration: TextDecoration.none,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
    builder: (context, child) {
      deviceWidth = MediaQuery.sizeOf(context).width;
      deviceHeight = MediaQuery.sizeOf(context).height;
      deviceAverageSize = (deviceWidth + deviceHeight) / 2;
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: ScrollConfiguration(behavior: MyBehavior(), child: child!),
      );
    },
    home: const BottomNav(),
  ));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
