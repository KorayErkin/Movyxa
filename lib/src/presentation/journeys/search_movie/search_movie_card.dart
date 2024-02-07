// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_two/src/common/constants/route_constants.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/data/core/api_constants.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:project_two/src/presentation/themes/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArguments(movie.id),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w.toDouble(),
          vertical: Sizes.dimen_2.h.toDouble(),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(
                Sizes.dimen_8.w.toDouble(),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Sizes.dimen_4.w.toDouble(),
                ),
                child: CachedNetworkImage(
                  imageUrl: movie.posterPath != null
                      ? '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}'
                      : 'https://www.flaticon.com/free-icon/image_4024538?related_id=4194756&origin=search',
                  width: Sizes.dimen_80.w.toDouble(),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.red,
                    size: Sizes.dimen_80.w.toDouble(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
