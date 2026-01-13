import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final Locale locale;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  String get languageName {
    switch (locale.languageCode) {
      case 'en':
        return "English";
      case 'zh':
        return "Chinese";
      case 'es':
        return "Spanish";
      case 'fr':
        return "French";
      case 'hi':
        return "Hindi";
      case 'bn':
        return "Bangla";
      default:
        return locale.languageCode.toUpperCase();
    }
  }

  String get flag {
    switch (locale.languageCode) {
      case 'en':
        return "🇬🇧";
      case 'zh':
        return "🇨🇳";
      case 'es':
        return "🇪🇸";
      case 'fr':
        return "🇫🇷";
      case 'hi':
        return "🇮🇳";
      case 'bn':
        return "🇧🇩";
      default:
        return "🌍";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(flag, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 12),
            Text(
              languageName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.blue : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
