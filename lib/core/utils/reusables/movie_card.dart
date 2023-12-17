import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tmdb_ui/core/utils/reusables/blur_container.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/features/favorite/presentation/bloc/favorite_bloc.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.id,
      required this.image,
      required this.releaseDate,
      required this.title,
      required this.overview,
      required this.rating});
  final int id;
  final String image;
  final String releaseDate;
  final String title;
  final String overview;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: BluryContainer(
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const SizedBox.shrink();
                      },
                    ),
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
                              fontSize: textSizeSmall,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: deviceWidth / 15,
                              itemCount: 5,
                              itemPadding: EdgeInsets.zero,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder: (context, state) {
                                context
                                    .read<FavoriteBloc>()
                                    .add(LoadFavMoviesEvent());
                                if (state is FavoriteCompleted) {
                                  return InkWell(
                                    onTap: () => context
                                        .read<FavoriteBloc>()
                                        .add(ToggleEvent(
                                            id: id,
                                            image: image,
                                            date: releaseDate,
                                            title: title,
                                            overview: overview,
                                            rating: rating)),
                                    child: Icon(
                                      Icons.favorite,
                                      color: state.favoriteMovies
                                              .any((e) => e.id == id)
                                          ? Colors.red
                                          : Colors.white,
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
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
