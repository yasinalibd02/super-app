import '../base/app_core.dart';
import 'icon.dart';

enum BSS {
  enabledBorder,
  b,
  disableBorder,
  focusedBorder,
  errorBorder,
  focusedErrorBorder,
}

enum BorderStyleType { outline, underline, none }

class CustomInputWidget extends StatefulWidget {
  final String hintText, label, phoneCode;
  final dynamic prefixIconPath;
  final int maxLines;
  final bool isValidator;
  final bool isPasswordField;
  final bool autoFocus;
  final bool readOnly;
  final bool isFilled;
  final bool showBorderSide;
  final bool validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? padding;
  final double? radius;
  final double borderWidth;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? fieldTextColor;
  final Color? shadowColor;
  final Decoration? customShapeDecoration;
  final EdgeInsetsGeometry? customPadding;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final AlignmentGeometry? alignment;
  final BorderStyleType borderStyle;
  const CustomInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIconPath = "",
    this.phoneCode = "",
    this.isValidator = true,
    this.isPasswordField = false,
    this.isFilled = true,
    this.validator = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.hintTextColor,
    this.prefixIcon,
    this.fieldTextColor = Colors.black,
    this.suffixIcon,
    this.maxLines = 1,
    this.borderWidth = 1,
    this.radius,
    this.onChanged,
    this.customPadding,
    this.padding,
    this.label = '',
    this.textInputType,
    this.inputFormatters,
    this.alignment,
    this.shadowColor,
    this.borderStyle = BorderStyleType.outline,
    this.fillColor,
    this.showBorderSide = true,
    this.customShapeDecoration,
  });

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  FocusNode? focusNode;
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(context),
          )
        : _buildTextFormFieldWidget(context);
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.black.withValues(alpha: 0.3),
      ),
      border: _setBorderStyle(BSS.b),
      enabledBorder: _setBorderStyle(BSS.enabledBorder),
      focusedBorder: _setBorderStyle(BSS.focusedBorder),
      disabledBorder: _setBorderStyle(BSS.disableBorder),
      errorBorder: _setBorderStyle(BSS.errorBorder),
      focusedErrorBorder: _setBorderStyle(BSS.focusedErrorBorder),
      prefixIcon: _setPrefixIcon(),
      suffixIcon: _setSuffixIcon(),
      fillColor: _setFillColor(context),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _buildTextFormFieldWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != "") ...[_buildTitle()],
        Container(
          height: 68,
          //decoration: _buildShapeDecoration(context),
          margin: EdgeInsets.zero,
          child: TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            focusNode: focusNode,
            autofocus: widget.autoFocus,
            style: _setFontStyle(),
            textAlign: TextAlign.left,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.isPasswordField ? isVisibility : false,
            textInputAction: TextInputAction.next,
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            minLines: 1,
            decoration: _buildDecoration(),
            validator: _setValidator(),
            cursorColor: AppColors.black,
            onChanged: widget.onChanged,
            onTap: () {
              setState(() {
                if (widget.readOnly) {
                } else {
                  focusNode!.requestFocus();
                }
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                focusNode!.unfocus();
              });
            },
            onEditingComplete: () {
              setState(() {
                focusNode!.unfocus();
              });
            },
            // onTapOutside: (value) {
            //   setState(() {
            //     focusNode!.unfocus();
            //   });
            // },
          ),
        ),
      ],
    );
  }

  _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppSize.fontSize.ts,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  _setBorderSide(borderSideStyle) {
    switch (borderSideStyle) {
      case BSS.enabledBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: AppColors.textColor.withValues(alpha: 0.2),
        );
      case BSS.b:
        return BorderSide(
          width: widget.borderWidth,
          color: AppColors.textColor.withValues(alpha: 0.2),
        );
      case BSS.disableBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: AppColors.textColor.withValues(alpha: 0.2),
        );
      case BSS.focusedBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: Theme.of(context).primaryColor,
        );
      case BSS.errorBorder:
        return BorderSide(width: widget.borderWidth, color: Colors.red);
      case BSS.focusedErrorBorder:
        return BorderSide(width: widget.borderWidth, color: Colors.red);
      default:
        return BorderSide(
          width: widget.borderWidth,
          color: AppColors.textColor.withValues(alpha: 0.2),
        );
    }
  }

  _setBorderStyle(borderSideStyle) {
    switch (widget.borderStyle) {
      case BorderStyleType.outline:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: widget.showBorderSide
              ? _setBorderSide(borderSideStyle)
              : BorderSide.none,
        );
      case BorderStyleType.underline:
        return UnderlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: widget.showBorderSide
              ? _setBorderSide(borderSideStyle)
              : BorderSide.none,
        );

      case BorderStyleType.none:
        return InputBorder.none;
    }
  }

  _setFillColor(BuildContext context) {
    return widget.fillColor ?? AppColors.white;
  }

  _setFilled() {
    return widget.isFilled;
  }

  _setFontStyle() {
    return AppStyle.inputFieldTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: widget.fieldTextColor,
    );
  }

  _setOutlineBorderRadius() {
    return BorderRadius.circular(widget.radius ?? 12);
  }

  _setPadding() {
    return widget.customPadding ??
        (widget.padding == null
            ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0)
            : EdgeInsets.all(widget.padding!));
  }

  _setPrefixIcon() {
    return widget.prefixIcon ??
        (widget.prefixIconPath != ''
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIcon(
                      widget.prefixIconPath,
                      height: 22,
                      color: focusNode!.hasFocus
                          ? AppColors.black
                          : AppColors.textColor.withValues(alpha: 0.2),
                    ),
                    Visibility(
                      visible: widget.phoneCode != '',
                      child: Row(
                        children: [
                          Text(
                            widget.phoneCode,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: focusNode!.hasFocus
                                  ? Theme.of(context).primaryColor
                                  : AppColors.textColor.withValues(alpha: 0.2),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 18,
                            width: 1,
                            color: focusNode!.hasFocus
                                ? Theme.of(context).primaryColor
                                : AppColors.textColor.withValues(alpha: 0.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : null);
  }

  _setSuffixIcon() {
    return widget.isPasswordField
        ? IconButton(
            icon: CustomIcon(
              isVisibility
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              color: focusNode!.hasFocus
                  ? AppColors.black
                  : AppColors.textColor.withValues(alpha: 0.3),
              height: 24,
            ),
            onPressed: () {
              setState(() {
                isVisibility = !isVisibility;
              });
            },
          )
        : widget.suffixIcon;
  }

  _setValidator() {
    return widget.isValidator == false
        ? null
        : (String? value) {
            if (value!.isEmpty) {
              return 'Please fill out the field';
            } else {
              return null;
            }
          };
  }
}
