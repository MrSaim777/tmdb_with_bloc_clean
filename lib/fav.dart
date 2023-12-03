import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_ui/core/utils/reusables/movie_card.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundContainer(),
            FadeInDown(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const MovieCard(
                      image:
                          'https://th.bing.com/th/id/OIP.xg6XZQvrc-1pZBoEh5sgagHaKl?rs=1&pid=ImgDetMain',
                      releaseDate: 'Nov 23, 2012',
                      title: 'Harry potter and the snack',
                      overview:
                          'Harry potter and the snack Harry potter and tk',
                      rating: 0.0,
                      isFavorite: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
