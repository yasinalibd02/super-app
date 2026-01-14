import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/l10n/app_localizations.dart';
import 'features/home/home_screen.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/language/presentation/bloc/language_event.dart';
import 'features/language/presentation/bloc/language_state.dart';
import 'features/language/presentation/screens/language_screen.dart';
import 'features/voice_search/presentation/screens/voice_search_screen.dart';
import 'features/stripe_payment/presentation/screens/stripe_payment_screen.dart';
import 'features/stories/presentation/screens/story_screen.dart';
import 'features/swipe_payment/presentation/screens/swipe_payment_screen.dart';
import 'features/smart_otp/presentation/screens/otp_screen.dart';
import 'features/double_tap_like/presentation/screens/like_screen.dart';
import 'features/hold_record/presentation/screens/record_screen.dart';
import 'features/confetti/presentation/screens/success_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeController()),
        BlocProvider(
          create: (_) => sl<LanguageBloc>()..add(GetLanguageEvent()),
        ),
      ],
      child: BlocBuilder<ThemeController, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              return MaterialApp(
                title: 'SuperApp',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
                locale: languageState.locale,

                /// 👇 supported locales
                supportedLocales: AppLocalizations.supportedLocales,

                /// 👇 localization delegates
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
                        builder: (_) => const HomeScreen(),
                      );
                    case '/language':
                      return MaterialPageRoute(
                        builder: (_) => const LanguageScreen(),
                      );
                    case '/voice_search':
                      return MaterialPageRoute(
                        builder: (_) => const VoiceSearchScreen(),
                      );
                    case '/stripe_payment_demo':
                      return MaterialPageRoute(
                        builder: (_) => const StripePaymentScreen(),
                      );
                    case '/stories':
                      return MaterialPageRoute(
                        builder: (_) => const StoryScreen(),
                      );
                    case '/swipe_payment':
                      return MaterialPageRoute(
                        builder: (_) => const SwipePaymentScreen(),
                      );
                    case '/smart_otp':
                      return MaterialPageRoute(
                        builder: (_) => const OtpScreen(),
                      );
                    case '/double_tap_like':
                      return MaterialPageRoute(
                        builder: (_) => const LikeScreen(),
                      );
                    case '/hold_record':
                      return MaterialPageRoute(
                        builder: (_) => const RecordScreen(),
                      );
                    case '/success_animation':
                      return MaterialPageRoute(
                        builder: (_) => const SuccessScreen(),
                      );
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
// import 'package:flutter/material.dart';
// import 'app.dart';

// import 'core/di/service_locator.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initDependencies();
//   runApp(const MyApp());
// }
