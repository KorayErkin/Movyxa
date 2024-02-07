import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two/src/common/constants/route_constants.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/data/core/api_constants.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:project_two/src/presentation/journeys/movie_detail/movie_detail_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Sizes.dimen_8.h.toDouble(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.dimen_8.w.toDouble(),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteList.movieDetail,
            arguments: MovieDetailArguments(movie.id),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_8.w.toDouble(),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h.toDouble(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                    DeleteFavoriteMovieEvent(movie.id),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      Sizes.dimen_12.w.toDouble(),
                    ),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_12.h.toDouble(),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
