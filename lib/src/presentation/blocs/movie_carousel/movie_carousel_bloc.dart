// ignore_for_file: override_on_non_overriding_member, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/domain/entities/no_params.dart';
import 'package:project_two/src/domain/usecases/get_trending.dart';
import 'package:project_two/src/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(
      (event, emit) async {
        final moviesEither = await getTrending(
          NoParams(),
        );
        emit(
          moviesEither.fold(
            (l) => MovieCarouselError(l.appErrorType),
            (movies) {
              movieBackdropBloc.add(
                MovieBackdropChangedEvent(
                  movies[event.defaultIndex],
                ),
              );
              return MovieCarouselLoaded(
                movies: movies,
                defaultIndex: event.defaultIndex,
              );
            },
          ),
        );
      },
    );
  }
}
