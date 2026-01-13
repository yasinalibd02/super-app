import 'package:flutter_svg/svg.dart';

import '../base/app_core.dart';

class CustomContainer extends StatefulWidget {
  ///* For Container
  final VoidCallback? onTap;
  final Widget? child;
  final double padding;
  final EdgeInsets? customPadding;
  final double? height;
  final double? width;
  final double opacity;
  final double borderWidth;
  final double margin;
  final EdgeInsets? customMargin;
  final Color? borderColor;
  final BorderStyle borderStyle;
  final Color? color;
  final double borderRadius;
  final BorderRadius? customBorderRadius;
  final Gradient? gradient;
  final double elevation;
  final String imagePath;
  final List<BoxShadow>? boxShadow;
  final bool zeroDownElevationOnTap;
  final bool allowOverflow;
  final bool isCircle;
  final CustomClipper<Path>? clipper;
  final bool expanded;
  final int flex;
  final Curve curve;

  ///* For InkWell
  final void Function(bool)? onHighlightChanged;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final ValueChanged<bool>? onHover;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? inkSplashRadius;
  final BoxBorder? customBorder;
  final bool enableFeedback;
  final bool excludeFromSemantics;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;
  final bool borderOnForeground;
  final bool semanticContainer;
  final AlignmentGeometry? alignment;
  final double? alignmentHeightFactor;
  final double? alignmentWidthFactor;
  final bool showBorder;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int milliseconds;
  final int microseconds;
  final Function(bool)? onExit;
  final Function(bool)? onEnter;
  final BoxConstraints? constraints;

  const CustomContainer({
    super.key,
    this.child,
    this.onTap,
    this.margin = 0.0,
    this.opacity = 1,
    this.customMargin,
    this.color,
    this.onHighlightChanged,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.inkSplashRadius,
    this.customBorder,
    this.focusNode,
    this.onFocusChange,
    this.alignmentWidthFactor,
    this.alignmentHeightFactor,
    this.boxShadow,
    this.alignment,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.allowOverflow = false,
    this.isCircle = false,
    this.borderRadius = 5,
    this.customBorderRadius,
    this.elevation = 1.5,
    this.padding = 0,
    this.imagePath = '',
    this.customPadding,
    this.gradient,
    this.zeroDownElevationOnTap = true,
    this.showBorder = false,
    this.borderWidth = 1,
    this.borderColor,
    this.borderStyle = BorderStyle.solid,
    this.clipper,
    this.expanded = false,
    this.flex = 1,
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.milliseconds = 0,
    this.microseconds = 0,
    this.onExit,
    this.curve = Curves.linear,
    this.onEnter,
    this.height,
    this.width,
    this.constraints,
  });

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  /// Elevation of the container.
  late double elevation;

  /// Whether the container is tapped or not.
  bool _isPressed = false;

  /// set bool value for change hover color
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    if (!_isPressed) elevation = widget.elevation;

    return widget.expanded
        ? Expanded(
            flex: widget.flex,
            child: widget.hoverColor == null
                ? _container(context)
                : _mouseRegion(_container(context)),
          )
        : widget.hoverColor == null
            ? _container(context)
            : _mouseRegion(_container(context));
  }

  _container(BuildContext context) {
    return ClipPath(
      clipper: widget.clipper,
      child: Opacity(
        opacity: widget.opacity,
        child: AnimatedContainer(
          constraints: widget.constraints,
          curve: widget.curve,
          height: widget.height,
          width: widget.width,
          padding: widget.customPadding ??
              EdgeInsets.only(
                left: widget.padding.h,
                top: widget.padding.v,
                right: widget.padding.h,
                bottom: widget.padding.v,
              ),
          margin: widget.customMargin ??
              EdgeInsets.only(
                left: widget.margin.h,
                top: widget.margin.v,
                right: widget.margin.h,
                bottom: widget.margin.v,
              ),
          clipBehavior: widget.allowOverflow ? Clip.none : Clip.hardEdge,
          decoration: _decorationWidget(),
          duration: Duration(
            days: widget.days,
            hours: widget.hours,
            minutes: widget.minutes,
            seconds: widget.seconds,
            milliseconds: widget.milliseconds,
            microseconds: widget.microseconds,
          ),
          child: _inkWell(
            child: (widget.alignment == null)
                ? widget.child
                : Align(
                    alignment: widget.alignment!,
                    heightFactor: widget.alignmentHeightFactor,
                    widthFactor: widget.alignmentWidthFactor,
                    child: widget.child,
                  ),
          ),
        ),
      ),
    );
  }

  ///* Decoration Widget
  _decorationWidget() {
    final borderRadius =
        widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius);

    return BoxDecoration(
      shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: widget.isCircle ? null : borderRadius,
      boxShadow: widget.boxShadow,
      color: isHovering
          ? widget.hoverColor
          : widget.color ?? widget.hoverColor ?? Theme.of(context).primaryColor,
      border: widget.showBorder
          ? (widget.customBorder ??
              Border.all(
                color: widget.borderColor ?? Theme.of(context).primaryColor,
                style: widget.borderStyle,
                width: widget.borderWidth,
              ))
          : null,
      gradient: widget.gradient,
      image: _imageWidget(),
    );
  }

  ///* Image Widget [check Image path]
  _imageWidget() {
    bool isNetworkImg = widget.imagePath.startsWith("http://") ||
        widget.imagePath.startsWith("https://");
    bool isSvgImg = widget.imagePath.endsWith('.svg');
    return widget.imagePath != ''
        ? DecorationImage(
            image: isNetworkImg
                ? NetworkImage(widget.imagePath)
                : isSvgImg
                    ? SvgPicture.asset(widget.imagePath) as ImageProvider
                    : AssetImage(widget.imagePath),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          )
        : null;
  }

  ///* MouseRegion change color on hover
  _mouseRegion(Widget child) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
          widget.onEnter!(isHovering);
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
          widget.onExit!(isHovering);
        });
      },
      child: child,
    );
  }

  ///* InkWell
  _inkWell({required var child}) {
    final borderRadius =
        widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius);

    return InkWell(
      borderRadius: borderRadius,
      radius: widget.inkSplashRadius,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onTapDown: widget.onTapDown,
      onTapCancel: widget.onTapCancel,
      onHover: widget.onHover,
      mouseCursor: widget.mouseCursor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      overlayColor: widget.overlayColor,
      splashColor: widget.splashColor,
      splashFactory: widget.splashFactory,
      customBorder: widget.customBorder,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      canRequestFocus: widget.canRequestFocus,
      autofocus: widget.autofocus,
      enableFeedback: widget.enableFeedback,
      excludeFromSemantics: widget.excludeFromSemantics,
      onTap: widget.onTap,
      onHighlightChanged: (v) {
        if (widget.zeroDownElevationOnTap) {
          _isPressed = v;
          if (widget.elevation == 0) {
            return;
          } else if (widget.elevation <= 2.5) {
            elevation = v ? 0 : widget.elevation;
          } else {
            elevation = v ? 2.5 : widget.elevation;
          }
          setState(() {});
        }
        if (widget.onHighlightChanged != null) {
          return widget.onHighlightChanged!(v);
        }
      },
      child: child,
    );
  }
}
