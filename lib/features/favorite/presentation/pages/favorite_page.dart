import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_ui/config/router/routes.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/core/utils/reusables/movie_card.dart';
import 'package:tmdb_ui/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);
    if (bloc.state is FavoriteLoading) {
      bloc.add(LoadFavMoviesEvent());
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundContainer(),
            FadeInLeftBig(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FavoriteFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: commonTextStyle(),
                      ),
                    );
                  } else if (state is FavoriteCompleted) {
                    return state.favoriteMovies.isEmpty
                        ? Center(
                            child: Text(
                              "No Movies",
                              style: commonTextStyle(),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(bottom: deviceHeight / 10),
                            itemCount: state.favoriteMovies.length,
                            itemBuilder: (context, index) {
                              final list = state.favoriteMovies[index];
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<MovieDetailBloc>()
                                      .add(LoadingEvent());
                                  context.goNamed(DETAIL, pathParameters: {
                                    ApiParam.id: list.id.toString()
                                  });
                                },
                                child: BlocBuilder<FavoriteBloc, FavoriteState>(
                                  builder: (c, s) {
                                    return MovieCard(
                                        onTapFavBtn: () {
                                          context
                                              .read<FavoriteBloc>()
                                              .add(LoadFavMoviesEvent());
                                          context.read<FavoriteBloc>().add(
                                              ToggleEvent(
                                                  id: list.id,
                                                  image: list.image,
                                                  date: list.date,
                                                  title: list.title,
                                                  overview: list.overview,
                                                  rating: list.rating));
                                        },
                                        isFav: true,
                                        id: list.id,
                                        image: list.image,
                                        releaseDate: list.date,
                                        title: list.title,
                                        overview: list.overview,
                                        rating: list.rating);
                                  },
                                ),
                              );
                            },
                          );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomSnackbar extends StatefulWidget {
//   final String message;

//   const CustomSnackbar({super.key, required this.message});

//   @override
//   _CustomSnackbarState createState() => _CustomSnackbarState();
// }

// class _CustomSnackbarState extends State<CustomSnackbar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );

//     // Start the animation
//     _animationController.forward();

//     // Auto-dismiss the Snackbar after a certain duration
//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _animation,
//       child: SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0, 1),
//           end: const Offset(0, 0),
//         ).animate(_animationController),
//         child: Container(
//           margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(10),
//             // border: Border.all(color: Colors.blue, width: 2),
//           ),
//           child: Text(
//             widget.message,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void showCustomSnackbar(BuildContext context, String message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       dismissDirection: DismissDirection.up,
//       content: CustomSnackbar(message: message),
//     ),
//   );
// }
