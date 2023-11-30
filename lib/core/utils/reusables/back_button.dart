import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.heroTag, this.onTap});
  final String? heroTag;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Hero(
        tag: heroTag ?? "backButton",
        child: FadeInLeftBig(
          child: Container(
            margin: EdgeInsets.only(top: deviceHeight / 50),
            padding: EdgeInsets.all(deviceWidth / 50),
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: const Center(
              child: Icon(CupertinoIcons.back),
            ),
          ),
        ),
      ),
    );
  }
}
