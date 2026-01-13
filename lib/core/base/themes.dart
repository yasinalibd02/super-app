import 'package:flutter_application/core/base/app_core.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.white,
    colorScheme: const ColorScheme.light(surface: Colors.white),
    scaffoldBackgroundColor: const Color(0xFFF7F8F8),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF5885E4),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(50),
      // ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: const Color(0xfff4f4f4).withValues(alpha: 0.5),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF5885E4)),
    textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF5885E4),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.deepOrange),
    textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
    // useMaterial3: true,
    colorScheme: const ColorScheme.dark(surface: Colors.white),
  );
  final _box = GetStorage();
  final _key = 'isDarkMode';
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    // Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    // _saveThemeToBox(!_loadThemeFromBox());
  }

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
}
