import 'package:flutter/gestures.dart';

import '../base/app_core.dart';

class CustomTextSpanWidget extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final VoidCallback? onSecondTextTap;
  final FontWeight? firstFontWeight;
  final FontWeight? secondFontWeight; // Callback for secondText tap

  const CustomTextSpanWidget(
      {super.key,
      this.firstText, // Nullable first text
      this.secondText, // Nullable second text
      this.firstTextColor, // Nullable first text color
      this.secondTextColor, // Nullable second text color
      this.onSecondTextTap,
      this.firstFontWeight,
      this.secondFontWeight // Nullable callback for tap
      });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText!, // Fallback to empty string if null
            style: TextStyle(
              color: firstTextColor ??
                  Colors.black.withValues(alpha: 0.5), // Default color if null
              fontSize: AppSize.fontSize.bm,
              fontWeight: firstFontWeight ?? FontWeight.w400,
            ),
          ),
          const TextSpan(
            text: ' ', // Space between the firstText and secondText
          ),
          if (secondText != null)
            TextSpan(
              text: secondText!, // Display second text
              style: TextStyle(
                color: secondTextColor ??
                    AppColors.primaryColor, // Default color if null
                fontSize: AppSize.fontSize.bm,
                fontWeight: secondFontWeight ?? FontWeight.w500,
                // decoration: TextDecoration
                //     .underline, // Optional underline to indicate clickability
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onSecondTextTap ??
                    () {
                      // Fallback action if no callback provided
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Second text tapped')),
                      );
                    },
            ),
        ],
      ),
    );
  }
}
