import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/widgets/background_container.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundContainer(),
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const MovieCard(
                    image:
                        'https://th.bing.com/th/id/OIP.xg6XZQvrc-1pZBoEh5sgagHaKl?rs=1&pid=ImgDetMain',
                    releaseDate: 'Nov 23, 2012',
                    title: 'Harry potter and the snack',
                    overview: 'Harry potter and the snack Harry potter and tk',
                    rating: 0.0,
                    isFavorite: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.image,
    required this.releaseDate,
    required this.title,
    required this.overview,
    required this.rating,
    required this.isFavorite,
  });

  final String image;
  final String releaseDate;
  final String title;
  final String overview;
  final double rating;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: deviceWidth / 40, vertical: deviceHeight / 120),
          height: deviceHeight / 6,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth / 50, vertical: deviceHeight / 100),
            child: Row(
              children: [
                Container(
                  width: deviceWidth / 3,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(fit: BoxFit.cover, image),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: deviceWidth / 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          releaseDate,
                          style: commonTextStyle(fontSize: textSizeSmall),
                        ),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: commonTextStyle(
                              fontSize: textSizeRegular,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: commonTextStyle(
                              fontSize: textSizeRegular,
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
