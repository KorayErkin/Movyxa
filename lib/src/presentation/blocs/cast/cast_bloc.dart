// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/domain/entities/app_error.dart';
import 'package:project_two/src/domain/entities/cast_entity.dart';
import 'package:project_two/src/domain/entities/movie_params.dart';
import 'package:project_two/src/domain/usecases/get_cast.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;

  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<LoadCastEvent>((event, emit) async {
      Either<AppError, List<CastEntity>> eitherResponse = await getCast(
        MovieParams(event.movieId),
      );

      emit(
        eitherResponse.fold(
          (l) => CastError(),
          (r) => CastLoaded(casts: r),
        ),
      );
    });
  }
}
