// ignore_for_file: library_prefixes, unused_import

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:project_two/src/data/core/api_client.dart';
import 'package:project_two/src/data/data_sources/movie_remote_data_source.dart';
import 'package:project_two/src/data/repositories/movie_repository_impl.dart';
import 'package:project_two/src/data/tables/movie_table.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';
import 'package:project_two/src/domain/entities/no_params.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';
import 'package:project_two/src/domain/usecases/get_trending.dart';
import 'package:project_two/src/di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:project_two/src/presentation/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(
    MovieTableAdapter(),
  );

  unawaited(
    getIt.init(),
  );

  runApp(
    const MovieApp(),
  );
}
