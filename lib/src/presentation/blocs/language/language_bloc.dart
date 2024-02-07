// ignore_for_file: override_on_non_overriding_member, depend_on_referenced_packages

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_two/src/common/constants/languages.dart';
import 'package:project_two/src/domain/entities/language_entity.dart';
import 'package:project_two/src/domain/entities/no_params.dart';
import 'package:project_two/src/domain/usecases/get_preferred_language.dart';
import 'package:project_two/src/domain/usecases/update_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
  }) : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        ) {
    on<ToggleLanguageEvent>(_onToggleLanguage);
    on<LoadPreferredLanguageEvent>(_onLoadPreferredLanguage);
  }

  void _onToggleLanguage(
      ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoaded(
      Locale(event.language.code),
    ));
  }

  void _onLoadPreferredLanguage(
      LoadPreferredLanguageEvent event, Emitter<LanguageState> emit) async {
    final response = await getPreferredLanguage(
      NoParams(),
    );
    response.fold(
      (l) => emit(LanguageError()),
      (r) => emit(LanguageLoaded(
            Locale(r),
          )),
    );
  }

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      await updateLanguage(event.language.code);
      add(
        LoadPreferredLanguageEvent(),
      );
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(
        NoParams(),
      );
      yield response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(
          Locale(r),
        ),
      );
    }
  }
}
