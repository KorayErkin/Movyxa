// ignore_for_file: override_on_non_overriding_member, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(_mapMovieBackdropChangedToState);
  }

  void _mapMovieBackdropChangedToState(
      MovieBackdropChangedEvent event, Emitter<MovieBackdropState> emit) {
    emit(MovieBackdropChanged(event.movie));
  }

  @override
  Stream<MovieBackdropState> mapEventToState(
    MovieBackdropEvent event,
  ) async* {
    yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  }
}
