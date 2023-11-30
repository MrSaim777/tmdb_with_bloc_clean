import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_ui/blur_container.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/home.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
//   late MovieDetailBloc movieDetailBloc;

//   @override
//   void initState() {
//     super.initState();
//     movieDetailBloc = context.read<MovieDetailBloc>();
//     movieDetailBloc.add(LoadMovieDetailEvent(id: int.parse(widget.id)));
//   }

//   @override
//   void dispose() {
//     super.dispose();
// movieDetailBloc.close();
//   }

  @override
  Widget build(BuildContext context) {
    if (context.read<MovieDetailBloc>().state is MovieDetailLoading) {
      context
          .read<MovieDetailBloc>()
          .add(LoadMovieDetailEvent(id: int.parse(widget.id)));
    }

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailLoaded) {
              return Stack(
                children: [
                  SizedBox(
                    height: deviceHeight,
                    width: deviceWidth,
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                            state.movie.posterPath),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceHeight / 20,
                        ),
                        FadeInDown(
                          child: Container(
                              height: deviceHeight / 3,
                              width: deviceWidth,
                              margin: EdgeInsets.symmetric(
                                  horizontal: deviceWidth / 50,
                                  vertical: deviceHeight / 50),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -deviceHeight / 30,
                                    child: FadeInDown(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: deviceWidth / 20),
                                        width: deviceWidth / 2.8,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: BaseUrl
                                                      .TRENDING_MOVIES_IMAGE_BASE_URL +
                                                  state.movie.posterPath),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -deviceHeight / 30,
                                    right: -deviceWidth / 20,
                                    child: FadeInRight(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: deviceWidth / 10),
                                        width: deviceWidth / 5,
                                        height: deviceHeight / 15,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                Constants.votes,
                                                style: commonTextStyle(
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                state.movie.voteAverage
                                                    .toStringAsFixed(1),
                                                style: commonTextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: textSizeBig),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: deviceHeight / 15,
                                    left: deviceWidth / 2.2,
                                    child: SizedBox(
                                      width: deviceWidth / 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${state.movie.title}: ${state.movie.tagline}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: commonTextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: textSizeMediumBig),
                                          ),
                                          Text(
                                            DateFormat('yyyy').format(
                                                state.movie.releaseDate),
                                            style: commonTextStyle(
                                                fontSize: textSizeSmall),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: deviceHeight / 50,
                                      top: deviceHeight / 4,
                                      right: 0,
                                      left: 0,
                                      child: FadeInDownBig(
                                        child: Container(
                                          height: deviceHeight / 15,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: deviceWidth / 20),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                size: deviceWidth / 14,
                                              ),
                                              SizedBox(
                                                width: deviceWidth / 50,
                                              ),
                                              Text(
                                                Constants.playTrailer,
                                                style: commonTextStyle(
                                                    fontSize: textSizeRegular,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                  // MovieCard(
                  // image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                  //     state.movie.posterPath,
                  //     releaseDate: state.movie.releaseDate.toString(),
                  //     title: state.movie.title,
                  //     overview: state.movie.overview,
                  //     rating: state.movie.voteAverage / 2,
                  //     isFavorite: false),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
