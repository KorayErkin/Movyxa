// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:project_two/src/data/data_sources/language_local_data_source.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await languageLocalDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return const Left(
        AppError(AppErrorType.database),
      );
    }
  }
}
