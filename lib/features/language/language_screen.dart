import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/l10n/app_localizations.dart';
import '../../core/l10n/locale_controller.dart';
import 'language_widgets.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supported = context.read<LocaleController>().supported;
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
                    locale == context.watch<LocaleController>().state.locale,
                onTap: () {
                  context.read<LocaleController>().add(
                    LocaleEventSelect(locale),
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
