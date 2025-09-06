import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/l10n/app_localizations.dart';
import 'core/l10n/locale_controller.dart';
import 'features/home/home_screen.dart';
import 'features/language/language_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeController()),
        BlocProvider(create: (_) => LocaleController()),
      ],
      child: BlocBuilder<ThemeController, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleController, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                title: 'SuperApp',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
                locale: localeState.locale,

                /// 👇 supported locales
                supportedLocales: context.read<LocaleController>().supported,

                /// 👇 localization delegates (fix added)
                localizationsDelegates: const [
                  AppLocalizations.delegate, // your custom l10n
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                /// ✅ Centralized routes
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return MaterialPageRoute(
                          builder: (_) => const HomeScreen());
                    case '/language':
                      return MaterialPageRoute(
                          builder: (_) => const LanguageScreen());
                    default:
                      return MaterialPageRoute(
                        builder: (_) => const Scaffold(
                          body: Center(child: Text("404 - Page Not Found")),
                        ),
                      );
                  }
                },
                initialRoute: '/',
              );
            },
          );
        },
      ),
    );
  }
}
