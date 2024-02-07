// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_detail_entity.dart';
import 'package:project_two/src/domain/entities/movie_params.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';
import 'package:project_two/src/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
