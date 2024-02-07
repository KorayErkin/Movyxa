import 'package:flutter/material.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:project_two/src/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:project_two/src/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:project_two/src/presentation/widgets/movie_app_bar.dart';
import 'package:project_two/src/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            const MovieDataWidget(),
            const Separator(),
          ],
        ),
      ],
    );
  }
}
