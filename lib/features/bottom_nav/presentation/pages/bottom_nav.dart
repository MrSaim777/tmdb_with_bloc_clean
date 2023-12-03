import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_ui/core/utils/constants/constant_colors.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/fav.dart';
import 'package:tmdb_ui/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:tmdb_ui/features/search/presentation/pages/search_page.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/pages/movies_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    // int index = context.<BottomNavBloc>read().index;
    return Scaffold(
      body: BlocBuilder<BottomNavBloc, int>(
        builder: (context, state) {
          final bottomNavBloc = BlocProvider.of<BottomNavBloc>(context);
          return Stack(
            children: [
              state == 0
                  ? const TrendingMoviesScreen()
                  : state == 1
                      ? const SearchScreen()
                      : state == 2
                          ? const FavoriteScreen()
                          : const SizedBox.shrink(),
              Hero(
                tag: 'backButton',
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: deviceHeight / 40,
                        horizontal: deviceWidth / 4),
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
                                  onPressed: () => bottomNavBloc.onTap(0),
                                  icon: Icon(
                                    CupertinoIcons.home,
                                    color: state == 0
                                        ? ConstantColors.appPrimaryColor
                                        : Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () => bottomNavBloc.onTap(1),
                                  icon: Icon(
                                    CupertinoIcons.search,
                                    color: state == 1
                                        ? ConstantColors.appPrimaryColor
                                        : Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () => bottomNavBloc.onTap(2),
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                    color: state == 2
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
          );
        },
      ),
    );
  }
}
