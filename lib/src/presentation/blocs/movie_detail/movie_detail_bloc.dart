// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_detail_entity.dart';
import 'package:project_two/src/domain/entities/movie_params.dart';
import 'package:project_two/src/domain/usecases/get_movie_detail.dart';
import 'package:project_two/src/presentation/blocs/cast/cast_bloc.dart';
import 'package:project_two/src/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:project_two/src/presentation/blocs/videos/videos_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.castBloc,
    required this.videosBloc,
    required this.favoriteBloc,
  }) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(_mapMovieDetailLoadToState);
  }

  void _mapMovieDetailLoadToState(
    MovieDetailLoadEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(event.movieId),
    );

    eitherResponse.fold(
      (l) => emit(
        MovieDetailError(),
      ),
      (r) => emit(
        MovieDetailLoaded(r),
      ),
    );

    castBloc.add(
      LoadCastEvent(
        movieId: event.movieId,
      ),
    );
    videosBloc.add(
      LoadVideosEvent(event.movieId),
    );
    favoriteBloc.add(
      CheckIfFavoriteMovieEvent(event.movieId),
    );
  }
}
