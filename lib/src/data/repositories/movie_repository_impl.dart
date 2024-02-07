// ignore_for_file: void_checks, unused_local_variable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:project_two/src/data/data_sources/movie_local_data_source.dart';
import 'package:project_two/src/data/data_sources/movie_remote_data_source.dart';
import 'package:project_two/src/data/models/cast_crew_result_data_model.dart';
import 'package:project_two/src/data/models/movie_detail_model.dart';
import 'package:project_two/src/data/models/movie_model.dart';
import 'package:project_two/src/data/tables/movie_table.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/domain/entities/video_entity.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(
      String searchTerm) async {
    try {
      final movies = await remoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      final table = MovieTable.fromMovieEntity(movieEntity);
      final response = await localDataSource.saveMovie(
        MovieTable.fromMovieEntity(movieEntity),
      );
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
    try {
      final response = await localDataSource.getMovies();
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId) async {
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId) async {
    try {
      final response = await localDataSource.checkIfMovieFavorite(movieId);
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }
}
