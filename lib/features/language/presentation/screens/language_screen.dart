import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../bloc/language_bloc.dart';
import '../bloc/language_event.dart';
import '../bloc/language_state.dart';
import '../widgets/language_card.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supported = AppLocalizations.supportedLocales;
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.translate("change_language"))),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth >= 600 && constraints.maxWidth < 1024) {
            crossAxisCount = 3; // Tablet
          } else if (constraints.maxWidth >= 1024) {
            crossAxisCount = 4; // Desktop
          }

          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: supported.length,
                itemBuilder: (context, index) {
                  final locale = supported[index];
                  return LanguageCard(
                    locale: locale,
                    isSelected:
                        locale.languageCode == state.locale.languageCode,
                    onTap: () {
                      context.read<LanguageBloc>().add(
                        ChangeLanguageEvent(locale),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
