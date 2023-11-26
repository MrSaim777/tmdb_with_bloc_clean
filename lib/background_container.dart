import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(1, 1),
            child: Container(
              height: 300,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1, -1),
            child: Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            ),
          ),
          // Align(
          //   alignment: const AlignmentDirectional(0, -0.1),
          //   child: Container(
          //     height: 300,
          //     width: 200,
          //     decoration: const BoxDecoration(
          //         shape: BoxShape.circle, color: Colors.red),
          //   ),
          // ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
