// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../app/import.dart';

class CustomRowWidget extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final double? leadingIconSize;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String? trailingText;
  final TextStyle? trailingTextStyle;
  final IconData? trailingIcon;
  final double? trailingIconSize;
  final bool? isSlected;
  final Widget? replacementWidget;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final VoidCallback? onTap;

  const CustomRowWidget({
    Key? key,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingIconSize,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.trailingText,
    this.trailingTextStyle,
    this.trailingIcon,
    this.trailingIconSize,
    this.isSlected = false,
    this.replacementWidget,
    this.padding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: Space.vertical.v10,
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.03),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        leadingIcon ?? Icons.person,
                        color: leadingIconColor ??
                            AppColors.black.withValues(alpha: 0.6),
                        size: leadingIconSize ?? 24.0,
                      ),
                    ),
                    Space.width.w10,
                    Column(
                      crossAxisAlignment:
                          crossAxisAlignment ?? CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: titleStyle ??
                                TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                                      .withValues(alpha: 0.7),
                                ),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: subtitleStyle ??
                                TextStyle(
                                  fontSize: 14,
                                  color: AppColors.black.withValues(alpha: 0.5),
                                ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (trailingText != null)
                      Text(
                        trailingText!,
                        style: trailingTextStyle ??
                            TextStyle(
                              fontSize: 14,
                              color: AppColors.textColor.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    const SizedBox(width: 10),
                    isSlected!
                        ? (replacementWidget ??
                            const SizedBox()) // Display replacement widget if selected
                        : Icon(
                            trailingIcon ??
                                Icons
                                    .arrow_forward_ios_outlined, // Default icon
                            size: trailingIconSize ?? 18.0,
                          ),
                  ],
                ),
              ],
            ),
            // Divider(
            //   height: 40,
            //   indent: 65,
            //   color: AppColors.black.withValues(alpha:0.1),
            // )
          ],
        ),
      ),
    );
  }
}
