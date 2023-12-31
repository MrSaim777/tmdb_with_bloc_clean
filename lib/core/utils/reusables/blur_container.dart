import 'dart:ui';

import 'package:flutter/material.dart';

class BluryContainer extends StatelessWidget {
  const BluryContainer(
      {super.key,
      this.height,
      this.width,
      this.opacity,
      this.margin,
      this.padding,
      this.alignment,
      this.decoration,
      required this.child});

  final double? height;
  final double? width;
  final double? opacity;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final BoxDecoration? decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: opacity ?? 10.0, sigmaY: opacity ?? 10.0),
            child: Container(
              margin: margin,
              padding: padding,
              alignment: alignment,
              height: height,
              width: width,
              decoration: decoration,
              child: child,
            )));
  }
}
