import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_ui/config/router/routes.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/core/utils/reusables/movie_card.dart';
import 'package:tmdb_ui/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // context.read<SearchBloc>().searchController.dispose();
    _debounce?.cancel();
    // context.read<SearchBloc>().close();
    super.dispose();
  }

  void _onTextChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      context.read<SearchBloc>().add(AddSearchQueryEvent(
          query: context.read<SearchBloc>().searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (searchBloc.state is SearchLoading) {
      searchBloc.add(AddSearchQueryEvent(
          query: searchBloc.searchController.text.toString()));
    }
    return SafeArea(
      child: GestureDetector(
        // onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            children: [
              const BackgroundContainer(),
              FadeInDownBig(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceHeight / 100,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: deviceWidth / 40),
                      child: Text(
                        'Search',
                        style: commonTextStyle(
                            fontSize: textSizeBig, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight / 100,
                          left: deviceWidth / 40,
                          right: deviceWidth / 40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [boxShadow]),
                      child: TextField(
                        // onTap: () => showSearch(
                        //     context: context,
                        //     delegate:
                        //         MySearchDelegate(hintText: "Search title, category etc")),
                        // readOnly: true,
                        controller: searchBloc.searchController,
                        // onChanged: (value) =>
                        //     searchBloc.add(AddSearchQueryEvent(query: value)),
                        onChanged: (value) => _onTextChanged(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(CupertinoIcons.search,
                                color: Colors.grey),
                            hintText: 'Search Here',
                            hintStyle: commonTextStyle(textColor: Colors.grey)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: deviceHeight / 100),
                      child: Divider(
                        color: Colors.grey.withOpacity(.1),
                      ),
                    ),
                    BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchFailure) {
                          return Center(
                            child: Text(
                              state.message,
                              style: commonTextStyle(),
                            ),
                          );
                        } else if (state is SearchCompleted) {
                          return searchBloc.searchController.text.isEmpty
                              ? Center(
                                  child: Text(
                                    "Search Movie",
                                    style: commonTextStyle(),
                                  ),
                                )
                              : searchBloc.searchController.text.isNotEmpty &&
                                      state.searchEntity.results.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Movie Found",
                                        style: commonTextStyle(),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.only(
                                            bottom: deviceHeight / 10),
                                        itemCount: state.searchEntity.results
                                            .where((e) =>
                                                e.posterPath.isNotEmpty &&
                                                e.title.isNotEmpty &&
                                                e.overview.isNotEmpty &&
                                                e.voteAverage != 0.0)
                                            .length,
                                        itemBuilder: (context, index) {
                                          final list =
                                              state.searchEntity.results[index];

                                          DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');

                                          String formattedDate =
                                              formatter.format(DateTime.now());

                                          return
                                              // index == 0
                                              //     ? Padding(
                                              //         padding: EdgeInsets.symmetric(
                                              //             horizontal: deviceWidth / 40),
                                              //         child: Text(
                                              //           'For you',
                                              //           style: commonTextStyle(
                                              //               fontSize: textSizeMediumBig,
                                              //               fontWeight: FontWeight.bold),
                                              //         ),
                                              //       )
                                              //     :
                                              GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<MovieDetailBloc>()
                                                  .add(LoadingEvent());
                                              context.goNamed(DETAIL,
                                                  pathParameters: {
                                                    ApiParam.id:
                                                        list.id.toString()
                                                  });
                                            },
                                            child: BlocBuilder<FavoriteBloc,
                                                FavoriteState>(
                                              builder: (c, s) {
                                                context
                                                    .read<FavoriteBloc>()
                                                    .add(LoadFavMoviesEvent());
                                                final favMovies = context
                                                    .read<FavoriteBloc>()
                                                    .favoriteMoviesList;
                                                bool isFav = favMovies.any(
                                                    (e) => e.id == list.id);
                                                // if (s is FavoriteCompleted) {}
                                                if (s is ToggleCompleted) {
                                                  return MovieCard(
                                                      onTapFavBtn: () => context
                                                          .read<FavoriteBloc>()
                                                          .add(ToggleEvent(
                                                              id: list.id,
                                                              image: BaseUrl
                                                                      .TRENDING_MOVIES_IMAGE_BASE_URL +
                                                                  list
                                                                      .posterPath,
                                                              date:
                                                                  formattedDate,
                                                              title: list.title,
                                                              overview:
                                                                  list.overview,
                                                              rating:
                                                                  list.voteAverage /
                                                                      2)),
                                                      isFav: s.isFavorite,
                                                      id: list.id,
                                                      image: BaseUrl
                                                              .TRENDING_MOVIES_IMAGE_BASE_URL +
                                                          list.posterPath,
                                                      releaseDate:
                                                          formattedDate,
                                                      title: list.title,
                                                      overview: list.overview,
                                                      rating: list.voteAverage);
                                                } else {
                                                  return MovieCard(
                                                      onTapFavBtn: () => context
                                                          .read<FavoriteBloc>()
                                                          .add(ToggleEvent(
                                                              id: list.id,
                                                              image: BaseUrl
                                                                      .TRENDING_MOVIES_IMAGE_BASE_URL +
                                                                  list
                                                                      .posterPath,
                                                              date:
                                                                  formattedDate,
                                                              title: list.title,
                                                              overview:
                                                                  list.overview,
                                                              rating:
                                                                  list.voteAverage /
                                                                      2)),
                                                      isFav: isFav,
                                                      id: list.id,
                                                      image: BaseUrl
                                                              .TRENDING_MOVIES_IMAGE_BASE_URL +
                                                          list.posterPath,
                                                      releaseDate:
                                                          formattedDate,
                                                      title: list.title,
                                                      overview: list.overview,
                                                      rating: list.voteAverage);
                                                }
                                              },
                                            ),
                                            // child: BlocBuilder<FavoriteBloc,
                                            //     FavoriteState>(
                                            //   builder: (c, s) {
                                            //     final favList = context.read<FavoriteBloc>().favoriteMoviesList
                                            //     return MovieCard(
                                            //         onTapFavBtn: () {},
                                            //         isFav: false,
                                            //         id: list.id,
                                            //         image: BaseUrl
                                            //                 .TRENDING_MOVIES_IMAGE_BASE_URL +
                                            //             list.posterPath,
                                            //         releaseDate: formattedDate,
                                            //         title: list.title,
                                            //         overview: list.overview,
                                            //         rating: list.voteAverage);
                                            //   },
                                            // ),
                                          );
                                        },
                                      ),
                                    );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
