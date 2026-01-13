import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/l10n/app_localizations.dart';
// import '../../core/l10n/locale_controller.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.translate("hello"),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/voice_search'),
              icon: const Icon(Icons.mic),
              label: const Text("Voice Search Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, '/stripe_payment_demo'),
              icon: const Icon(Icons.credit_card),
              label: const Text("Stripe Payment Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/stories'),
              icon: const Icon(Icons.amp_stories),
              label: const Text("Instagram Stories Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/swipe_payment'),
              icon: const Icon(Icons.swipe),
              label: const Text("Swipe Payment Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/smart_otp'),
              icon: const Icon(Icons.password),
              label: const Text("Smart OTP Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/double_tap_like'),
              icon: const Icon(Icons.favorite),
              label: const Text("Double Tap Like Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/hold_record'),
              icon: const Icon(Icons.mic_none),
              label: const Text("Hold to Record Demo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, '/success_animation'),
              icon: const Icon(Icons.celebration),
              label: const Text("Success Animation Demo"),
            ),
          ],
        ),
      ),
    );
  }
}
