import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';
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

    return Scaffold(
      body: FadeInDown(
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const CircularProgressIndicator();
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
                  MovieCard(
                      image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                          state.movie.posterPath,
                      releaseDate: state.movie.releaseDate.toString(),
                      title: state.movie.title,
                      overview: state.movie.overview,
                      rating: 0.0,
                      isFavorite: false),
                ],
              );

              // return MovieCard(
              // image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
              //     state.movie.posterPath,
              //     releaseDate: state.movie.releaseDate.toString(),
              //     title: state.movie.title,
              //     overview: state.movie.overview,
              //     rating: 0.0,
              //     isFavorite: false);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
