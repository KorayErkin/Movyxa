import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_two/src/common/constants/route_constants.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/data/core/api_constants.dart';
import 'package:project_two/src/presentation/journeys/movie_detail/movie_detail_arguments.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(
        Sizes.dimen_16.w.toDouble(),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteList.movieDetail,
            arguments: MovieDetailArguments(movieId),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_16.w.toDouble(),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
