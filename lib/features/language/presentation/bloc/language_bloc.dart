import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/change_language_usecase.dart';
import '../../domain/usecase/get_language_usecase.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetLanguageUseCase getLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  LanguageBloc({
    required this.getLanguageUseCase,
    required this.changeLanguageUseCase,
  }) : super(const LanguageState(locale: Locale('en'))) {
    on<GetLanguageEvent>(_onGetLanguage);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onGetLanguage(
    GetLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final result = await getLanguageUseCase();
    result.fold(
      (failure) =>
          emit(const LanguageState(locale: Locale('en'))), // Default on error
      (languageEntity) => emit(LanguageState(locale: languageEntity.locale)),
    );
  }

  void _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final result = await changeLanguageUseCase(event.locale);
    result.fold(
      (failure) => null, // Handle error if needed (e.g. show toast)
      (success) => emit(LanguageState(locale: event.locale)),
    );
  }
}
