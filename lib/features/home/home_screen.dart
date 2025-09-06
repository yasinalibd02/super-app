import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/l10n/app_localizations.dart';
import '../../core/l10n/locale_controller.dart';
import '../../core/theme/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.translate("hello")),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => Navigator.pushNamed(context, '/language'),
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () =>
                context.read<ThemeController>().add(ThemeEvent.toggle),
          ),
        ],
      ),
      body: Center(
        child: Text(
          t.translate("hello"),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
