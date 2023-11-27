import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/bloc/trending_movies_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';
import 'package:tmdb_ui/home.dart';

class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<TrendingMoviesBloc>().state is TrendingMoviesLoading) {
      context.read<TrendingMoviesBloc>().add(const LoadTredingMovies(page: 1));
    }
    return Scaffold(
      body: Center(
        child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
          builder: (context, state) {
            if (state is TrendingMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TrendingMoviesCompleted) {
              return Stack(
                children: [
                  const BackgroundContainer(),
                  ListView.builder(
                    itemBuilder: (c, i) {
                      return MovieCard(
                          image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                              state.movies[i].knownFor[0].posterPath,
                          releaseDate: state.movies[i].knownFor[0].releaseDate
                              .toString(),
                          title: state.movies[i].knownFor[0].title ??
                              state.movies[i].knownFor[0].name ??
                              state.movies[i].knownFor[0].originalName!,
                          overview: state.movies[i].knownFor[0].overview,
                          rating: 0.0,
                          isFavorite: false);
                    },
                    itemCount: state.movies.length,
                  ),
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
