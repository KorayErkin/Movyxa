// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/domain/entities/movie_search_params.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';
import 'package:project_two/src/domain/usecases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams searchParams) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}
