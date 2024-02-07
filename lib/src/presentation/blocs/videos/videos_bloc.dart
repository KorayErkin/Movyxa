// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_params.dart';
import 'package:project_two/src/domain/entities/video_entity.dart';
import 'package:project_two/src/domain/usecases/get_videos.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({
    required this.getVideos,
  }) : super(VideosInitial()) {
    on<LoadVideosEvent>(_mapLoadVideosEventToState);
  }

  void _mapLoadVideosEventToState(
      LoadVideosEvent event, Emitter<VideosState> emit) async {
    final Either<AppError, List<VideoEntity>> eitherVideoResponse =
        await getVideos(
      MovieParams(event.movieId),
    );

    emit(
      eitherVideoResponse.fold(
        (l) => NoVideos(),
        (r) => VideosLoaded(r),
      ),
    );
  }
}
