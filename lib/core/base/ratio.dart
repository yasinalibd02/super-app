// ignore_for_file: deprecated_member_use

part of 'app_core.dart';

/// **This class depend on:**
/// * [AppSize]
abstract class AppRatio {
  static num designWidth = 414; // set phone width
  static num designHeight = 896; // set phone height
  static num statusBarHeight = 30; // set phone statusBar height
  static late double height;
  static late double width;

  static init(BuildContext context) {
    Size size = WidgetsBinding.instance.window.physicalSize /
        WidgetsBinding.instance.window.devicePixelRatio;
    num statusBar = MediaQuery.of(context).viewPadding.top;
    num bottomBar = MediaQuery.of(context).viewPadding.bottom;
    height = size.height - statusBar - bottomBar;
    width = size.width;
  }

  static double horizontalSize(double px) {
    if (DeviceType.isDesktop) {
      designWidth = AppSize.deviceSize.desktop;
    } else if (DeviceType.isPhone) {
      designWidth = AppSize.deviceSize.phone;
    } else if (DeviceType.isTablet) {
      designWidth = AppSize.deviceSize.tablet;
    } else {
      designWidth = AppSize.deviceSize.watch;
    }

    // debugPrint(designWidth.toString());
    return ((px * width) / designWidth);
  }

  static double verticalSize(double px) {
    return ((px * height) / (designHeight - statusBarHeight));
  }
}

extension SupperSize on double {
  double get h => AppRatio.horizontalSize(this);
  double get r => AppRatio.horizontalSize(this);
  double get v => AppRatio.verticalSize(this);
  double get fontSize => size();
  double size() {
    var height = AppRatio.horizontalSize(this);
    var width = AppRatio.verticalSize(this);
    if (height < width) {
      return height.toInt().toDouble();
    } else {
      return width.toInt().toDouble();
    }
  }
}
