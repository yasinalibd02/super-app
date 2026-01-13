import 'dart:ui';

import 'package:template/core/base/app_core.dart';

import '../base/app_core.dart';
import '../utils/globals.dart';

class ShowApp {
  static dialog({
    ShapeBorder? customShape,
    double radius = 20.0,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    double? elevation,
    double borderWidth = 1,
    Color? shadowColor,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
    Curve curves = Curves.decelerate,
    EdgeInsets? padding,
    Clip clip = Clip.none,
    Color barrierColor = Colors.black54,
    Color? borderColor,
    bool barrierDismissible = true,
    bool showBorder = false,
    List<Widget> children = const <Widget>[],
    BlendMode blendMode = BlendMode.srcOver,
    ImageFilter? customFilter,
    double sigmaX = 3.0,
    double sigmaY = 3.0,
    TileMode tileMode = TileMode.clamp,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    showDialog(
      context: navigatorKey.currentState!.context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        const String redColor = '\u001b[31m';
        if (children.isEmpty) {
          debugPrint('$redColor Children isEmpty');
        }
        return BackdropFilter(
          filter:
              customFilter ??
              ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
                tileMode: tileMode,
              ),
          blendMode: blendMode,
          child: Dialog(
            shape:
                customShape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: showBorder
                      ? BorderSide(
                          width: borderWidth,
                          color: borderColor ?? Theme.of(context).primaryColor,
                        )
                      : BorderSide.none,
                ),
            alignment: alignment,
            backgroundColor: backgroundColor,
            elevation: elevation,
            shadowColor: shadowColor,
            insetAnimationCurve: curves,
            surfaceTintColor: backgroundColor,
            insetPadding: padding,
            clipBehavior: clip,
            insetAnimationDuration: Duration(
              days: days,
              hours: hours,
              minutes: minutes,
              seconds: seconds,
              milliseconds: milliseconds,
              microseconds: microseconds,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            ),
          ),
        );
      },
    );
  }

  static draggableSheet({
    double initialChildSize = .4,
    double minChildSize = .4,
    double maxChildSize = 1,
    Color? bgColor,
    required Widget Function(BuildContext, ScrollController) builder,
  }) {
    return DraggableScrollableSheet(
      builder: builder,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
    );
  }

  static bottomSheet({
    Color? backgroundColor,
    Color? barrierColor,
    Clip? clip,
    double radius = 30.0,
    double borderWidth = 1,
    BoxConstraints? constraints,
    double? elevation,
    Color? borderColor,
    bool showBorder = false,
    bool enableDrag = true,
    bool isDismissible = true,
    bool isScrollControlled = false,
    ShapeBorder? customShape,
    AnimationController? transitionAnimationController,
    bool useSafeArea = false,
    bool useRootNavigator = false,
    Offset? anchorPoint,
    RouteSettings? routeSettings,
    List<Widget> children = const <Widget>[],
    BlendMode blendMode = BlendMode.srcOver,
    ImageFilter? customFilter,
    double sigmaX = 0,
    double sigmaY = 0,
    TileMode tileMode = TileMode.clamp,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    showModalBottomSheet(
      context: navigatorKey.currentState!.context,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      clipBehavior: clip,
      constraints: constraints,
      elevation: elevation,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      shape:
          customShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
            side: showBorder
                ? BorderSide(
                    width: borderWidth,
                    color:
                        borderColor ??
                        Theme.of(
                          navigatorKey.currentState!.context,
                        ).primaryColor,
                  )
                : BorderSide.none,
          ),
      transitionAnimationController: transitionAnimationController,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      anchorPoint: anchorPoint,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter:
              customFilter ??
              ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
                tileMode: tileMode,
              ),
          blendMode: blendMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          ),
        );
      },
    );
  }

  static datePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Offset? anchorPoint,
    String? cancelText,
    String? confirmText,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    String? helpText,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    TextInputType? keyboardType,
    TransitionBuilder? builder,
    Locale? locale,
    RouteSettings? routeSettings,
    bool Function(DateTime)? selectableDayPredicate,
    bool useRootNavigator = true,
    TextDirection? textDirection,
    DateTime? currentDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: navigatorKey.currentState!.context,
      initialDate: initialDate ??= DateTime.now(),
      firstDate: firstDate ?? DateTime(2015, 8),
      lastDate: lastDate ?? DateTime(2101),
      anchorPoint: anchorPoint,
      cancelText: cancelText,
      confirmText: confirmText,
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      helpText: helpText,
      initialEntryMode: initialEntryMode,
      keyboardType: keyboardType,
      builder: builder,
      locale: locale,
      routeSettings: routeSettings,
      selectableDayPredicate: selectableDayPredicate,
      useRootNavigator: useRootNavigator,
      textDirection: textDirection,
      currentDate: currentDate ?? DateTime.now(),
    );
    if (picked != null && picked != Globals.selectedDate.value) {
      Globals.selectedDate.value = picked;
    }
  }
}
