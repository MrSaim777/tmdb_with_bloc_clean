import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Center(
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailLoaded) {
              return Stack(
                children: [
                  const BackgroundContainer(),
                  MovieCard(
                      image: BaseUrl.TRENDING_MOVIES_IMAGE_BASE_URL +
                          state.movie.posterPath,
                      releaseDate: state.movie.releaseDate.toString(),
                      title: state.movie.title,
                      overview: state.movie.overview,
                      rating: 0.0,
                      isFavorite: false)
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