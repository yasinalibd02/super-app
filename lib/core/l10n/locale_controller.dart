import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LocaleEvent {}

class LocaleEventCycle extends LocaleEvent {}

class LocaleEventSelect extends LocaleEvent {
  final Locale locale;
  LocaleEventSelect(this.locale);
}

class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class LocaleController extends Bloc<LocaleEvent, LocaleState> {
  final List<Locale> supported = const [
    Locale('en'),
    Locale('zh'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('bn'),
  ];

  LocaleController() : super(const LocaleState(Locale('en'))) {
    on<LocaleEventCycle>((event, emit) {
      final currentIndex = supported.indexOf(state.locale);
      final nextIndex = (currentIndex + 1) % supported.length;
      emit(LocaleState(supported[nextIndex]));
    });

    on<LocaleEventSelect>((event, emit) {
      emit(LocaleState(event.locale));
    });
  }
}
