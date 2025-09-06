import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

class ThemeState {
  final bool isDark;
  const ThemeState({required this.isDark});
}

class ThemeController extends Bloc<ThemeEvent, ThemeState> {
  ThemeController() : super(const ThemeState(isDark: false)) {
    on<ThemeEvent>((event, emit) {
      if (event == ThemeEvent.toggle) {
        emit(ThemeState(isDark: !state.isDark));
      }
    });
  }
}
