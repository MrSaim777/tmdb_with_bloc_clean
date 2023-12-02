import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_ui/core/utils/constants/constant_colors.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/fav.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/pages/movies_page.dart';
import 'package:tmdb_ui/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectednavButton = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          selectednavButton == 0
              ? const TrendingMoviesScreen()
              : selectednavButton == 1
                  ? const SearchScreen()
                  : selectednavButton == 2
                      ? const FavoriteScreen()
                      : const SizedBox.shrink(),
          Hero(
            tag: 'backButton',
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceHeight / 40, horizontal: deviceWidth / 4),
                child: FadeInUp(
                  child: Container(
                    height: deviceHeight / 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [boxShadow],
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () => setState(() {
                                    selectednavButton = 0;
                                  }),
                              icon: Icon(
                                CupertinoIcons.home,
                                color: selectednavButton == 0
                                    ? ConstantColors.appPrimaryColor
                                    : Colors.black,
                              )),
                          IconButton(
                              onPressed: () => setState(() {
                                    selectednavButton = 1;
                                  }),
                              icon: Icon(
                                CupertinoIcons.search,
                                color: selectednavButton == 1
                                    ? ConstantColors.appPrimaryColor
                                    : Colors.black,
                              )),
                          IconButton(
                              onPressed: () => setState(() {
                                    selectednavButton = 2;
                                  }),
                              icon: Icon(
                                CupertinoIcons.heart,
                                color: selectednavButton == 2
                                    ? ConstantColors.appPrimaryColor
                                    : Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
