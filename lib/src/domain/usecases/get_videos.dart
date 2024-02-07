// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_params.dart';
import 'package:project_two/src/domain/entities/video_entity.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';
import 'package:project_two/src/domain/usecases/usecase.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getVideos(movieParams.id);
  }
}
