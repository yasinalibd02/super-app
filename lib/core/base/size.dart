part of 'app_core.dart';

/// **This class depend on:**
/// * [AppRatio] for get responsible sizes
class AppSize {
  static late double height;
  static late double width;
  static late EdgeInsets padding;
  static late EdgeInsets viewInsets;
  static late MediaQueryData mediaQuery;
  static late double shortestSide;

  static double space = 10.0;
  static double radius = 10.0;
  static double vertical = 24.0.v;
  static double appBarHeight = 50.0.v;
  static double bottomBarHeight = 70.0.v;
  static double buttonSize = 56.0.v;
  static double horizontal = 24.0.h;
  static double paddingAll = 24.0;
  static late IconSizeModel iconSize;
  static late FontSizeModel fontSize;
  static late DeviceModel deviceSize;

  static init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    height = mediaQuery.size.height;
    width = mediaQuery.size.width;
    padding = mediaQuery.padding;
    viewInsets = mediaQuery.viewInsets;
    shortestSide = MediaQuery.sizeOf(context).shortestSide;
    iconSize = IconSizeModel(l: 36.0.v, m: 24.0.v, s: 16.0.v);
    deviceSize =
        DeviceModel(desktop: 1200, tablet: 600, phone: 414, watch: 300);
    fontSize = FontSizeModel(
      dl: 57.0.fontSize,
      dm: 45.0.fontSize,
      ds: 36.0.fontSize,
      hl: 32.0.fontSize,
      hm: 28.0.fontSize,
      hs: 24.0.fontSize,
      tl: 22.0.fontSize,
      tm: 16.0.fontSize,
      ts: 14.0.fontSize,
      ll: 14.0.fontSize,
      lm: 12.0.fontSize,
      ls: 11.0.fontSize,
      bl: 16.0.fontSize,
      bm: 14.0.fontSize,
      bs: 12.0.fontSize,
    );
  }
}
