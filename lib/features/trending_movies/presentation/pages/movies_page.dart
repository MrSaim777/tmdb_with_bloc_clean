import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_ui/config/extensions/build_context_extension.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/core/utils/reusables/movie_card.dart';
import 'package:tmdb_ui/config/router/routes.dart';
import 'package:tmdb_ui/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/bloc/trending_movies_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';

class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<TrendingMoviesBloc>().state is TrendingMoviesLoading) {
      context.read<TrendingMoviesBloc>().add(const LoadTredingMovies(page: 1));
    }
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundContainer(),
          BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
            builder: (context, state) {
              if (state is TrendingMoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TrendingMoviesError) {
                return Center(
                  child: Text(
                    state.message,
                    style: commonTextStyle(),
                  ),
                );
              } else if (state is TrendingMoviesCompleted) {
                return FadeInLeftBig(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        bottom: context.height / 10, top: context.height / 20),
                    itemCount: state.movies.length,
                    itemBuilder: (c, i) {
                      DateFormat formatter = DateFormat('yyyy-MM-dd');
                      String formattedDate = formatter.format(
                          state.movies[i].knownFor[0].releaseDate ??
                              DateTime.now());
                      return GestureDetector(
                        onTap: () {
                          context.read<MovieDetailBloc>().add(LoadingEvent());
                          context.goNamed(DETAIL, pathParameters: {
                            ApiParam.id:
                                state.movies[i].knownFor[0].id.toString()
                          });
                        },
                        child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (c, s) {
                            context
                                .read<FavoriteBloc>()
                                .add(LoadFavMoviesEvent());
                            final favMovies =
                                context.read<FavoriteBloc>().favoriteMoviesList;
                            bool isFav = favMovies.any(
                                (e) => e.id == state.movies[i].knownFor[0].id);
                            // if (s is FavoriteCompleted) {}
                            if (s is ToggleCompleted) {
                              return MovieCard(
                                onTapFavBtn: () => context
                                    .read<FavoriteBloc>()
                                    .add(ToggleEvent(
                                        id: state.movies[i].knownFor[0].id,
                                        image: BaseUrl
                                                .TRENDING_MOVIES_IMAGE_BASE_URL +
                                            state.movies[i].knownFor[0]
                                                .posterPath,
                                        date: formattedDate,
                                        title: state
                                                .movies[i].knownFor[0].title ??
                                            state.movies[i].knownFor[0].name ??
                                            state.movies[i].knownFor[0]
                                                .originalName!,
                                        overview: state
                                            .movies[i].knownFor[0].overview,
                                        rating: state.movies[i].knownFor[0]
                                                .voteAverage /
                                            2)),
                                isFav: s.isFavorite,
                                id: state.movies[i].knownFor[0].id,
                                image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                                    state.movies[i].knownFor[0].posterPath,
                                releaseDate: formattedDate,
                                title: state.movies[i].knownFor[0].title ??
                                    state.movies[i].knownFor[0].name ??
                                    state.movies[i].knownFor[0].originalName!,
                                overview: state.movies[i].knownFor[0].overview,
                                rating:
                                    state.movies[i].knownFor[0].voteAverage / 2,
                              );
                            } else {
                              return MovieCard(
                                onTapFavBtn: () => context
                                    .read<FavoriteBloc>()
                                    .add(ToggleEvent(
                                        id: state.movies[i].knownFor[0].id,
                                        image: BaseUrl
                                                .TRENDING_MOVIES_IMAGE_BASE_URL +
                                            state.movies[i].knownFor[0]
                                                .posterPath,
                                        date: formattedDate,
                                        title: state
                                                .movies[i].knownFor[0].title ??
                                            state.movies[i].knownFor[0].name ??
                                            state.movies[i].knownFor[0]
                                                .originalName!,
                                        overview: state
                                            .movies[i].knownFor[0].overview,
                                        rating: state.movies[i].knownFor[0]
                                                .voteAverage /
                                            2)),
                                isFav: isFav,
                                id: state.movies[i].knownFor[0].id,
                                image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                                    state.movies[i].knownFor[0].posterPath,
                                releaseDate: formattedDate,
                                title: state.movies[i].knownFor[0].title ??
                                    state.movies[i].knownFor[0].name ??
                                    state.movies[i].knownFor[0].originalName!,
                                overview: state.movies[i].knownFor[0].overview,
                                rating:
                                    state.movies[i].knownFor[0].voteAverage / 2,
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
