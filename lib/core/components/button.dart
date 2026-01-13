// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import '../base/app_core.dart';
import 'text.dart';

class CustomButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback onTap;
  final String title;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final double? padding;
  final EdgeInsetsGeometry? customPadding;
  final GoogleFontFamily? fontFamily;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? shadowColor;
  final OutlinedBorder? shape;
  final double? fontSize;
  final double? titleSize;
  final FontWeight? fontWeight;
  final double? elevation;
  final bool isDisabled; // New parameter
  final String? disableText; // New parameter

  const CustomButton({
    super.key,
    this.child,
    required this.onTap,
    required this.title,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.padding,
    this.customPadding,
    this.fontFamily,
    this.buttonColor,
    this.buttonTextColor,
    this.shadowColor,
    this.shape,
    this.fontSize,
    this.titleSize,
    this.fontWeight,
    this.elevation,
    this.isDisabled = false, // Default to false
    this.disableText,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isShowDialog = false;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Size size = MediaQuery.of(context).size;

    // Determine button color based on disabled state
    Color currentButtonColor = widget.isDisabled
        ? AppColors.disabled
        : (widget.buttonColor ?? primaryColor);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowDialog) ...[
          // Padding(
          //   padding: Space.horizontal.h20 + Space.bottom.b5,
          //   child: ClipPath(
          //     clipper: LowerNipMessageClipper(MessageType.receive),
          //     child: Container(
          //       padding:
          //           Space.horizontal.h20 + Space.bottom.b15 + Space.top.t10,
          //       color: AppColors.primaryColor.withValues(alpha:0.12),
          //       child: Text(
          //         widget.disableText ?? '',
          //         style: TextStyle(color: AppColors.primaryColor),
          //       ),
          //     ),
          //   ),
          // ),

          CustomText(
            widget.disableText ?? '',
            customMargin: Space.horizontal.h10 * 0.7 + Space.bottom.b5,
            style: TextStyle(color: AppColors.red),
          )
        ],
        SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: widget.isDisabled
                ? () {
                    setState(() {
                      if (!isShowDialog) {
                        isShowDialog = true;
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            isShowDialog = false;
                          });
                        });
                      }
                    });
                  }
                : widget.onTap,
            style: ElevatedButton.styleFrom(
              elevation: widget.elevation ?? 0,
              surfaceTintColor: Colors.transparent,
              shape: widget.shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      widget.radius ?? AppSize.radius * 1.5,
                    ),
                  ),
              backgroundColor: currentButtonColor,
              side: BorderSide(
                width: widget.borderWidth ?? 1,
                color: widget.borderColor ?? currentButtonColor,
              ),
              padding: widget.customPadding ?? Space.all.a15 * 0.9,
              shadowColor: widget.shadowColor ?? Theme.of(context).shadowColor,
            ),
            child: widget.child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      widget.title,
                      color: widget.isDisabled
                          ? AppColors.disabledText
                          : (widget.buttonTextColor ?? Colors.white),
                      fontWeight: widget.fontWeight ?? FontWeight.w500,
                      size: widget.titleSize ?? AppSize.fontSize.tl,
                      fontFamily: widget.fontFamily ?? GoogleFontFamily.roboto,
                    ),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}

class LowerNipMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double sizeOfNip;
  final double sizeRatio;

  LowerNipMessageClipper(this.type,
      {this.bubbleRadius = 16, this.sizeOfNip = 8, this.sizeRatio = 4});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.send) {
      path.lineTo(size.width - bubbleRadius - sizeOfNip, 0);
      path.arcToPoint(Offset(size.width - sizeOfNip, bubbleRadius),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(size.width - sizeOfNip, size.height - sizeRatio * sizeOfNip);

      path.quadraticBezierTo(size.width - sizeOfNip, size.height - sizeOfNip,
          size.width, size.height);
      path.quadraticBezierTo(size.width - sizeOfNip, size.height - sizeOfNip,
          size.width - sizeRatio * sizeOfNip, size.height - sizeOfNip);

      path.lineTo(bubbleRadius, size.height - sizeOfNip);

      path.arcToPoint(Offset(0, size.height - bubbleRadius - sizeOfNip),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(0, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius, 0),
          radius: Radius.circular(bubbleRadius));
    } else {
      path.lineTo(size.width - bubbleRadius, 0);
      path.arcToPoint(Offset(size.width, bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius - sizeOfNip);
      path.arcToPoint(
          Offset(size.width - bubbleRadius, size.height - sizeOfNip),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(sizeRatio * sizeOfNip, size.height - sizeOfNip);

      path.quadraticBezierTo(
          sizeOfNip, size.height - sizeOfNip, 0, size.height);
      path.quadraticBezierTo(sizeOfNip, size.height - sizeOfNip, sizeOfNip,
          size.height - sizeRatio * sizeOfNip);

      path.lineTo(sizeOfNip, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius + sizeOfNip, 0),
          radius: Radius.circular(bubbleRadius));
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}

enum MessageType { send, receive }
