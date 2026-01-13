part of 'app_core.dart';

/// set media query value into width variable
late double width;
late double shortestSide;

/// get device width check [GeneralPlatform]
double get _getDeviceWidth {
  // if (GeneralPlatform.isWeb) {
  //   return width;
  // }
  return shortestSide;
}

/// get device type [DeviceTypes]
DeviceTypes get deviceTypes {
  final width = _getDeviceWidth;
  if (width >= 1200) return DeviceTypes.desktop;
  if (width >= 600) return DeviceTypes.tablet;
  if (width < 300) return DeviceTypes.watch;
  return DeviceTypes.phone;
}

class DeviceType {
  static bool isDesktop = false;
  static bool isTablet = false;
  static bool isPhone = false;
  static bool isWatch = false;

  static void init(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    shortestSide = MediaQuery.sizeOf(context).shortestSide;
    isDesktop = (deviceTypes == DeviceTypes.desktop);
    isTablet = (deviceTypes == DeviceTypes.tablet);
    isWatch = (deviceTypes == DeviceTypes.watch);
    isPhone = (deviceTypes == DeviceTypes.phone);
  }
}

class DeviceLayout extends StatelessWidget {
  final Widget? watch;
  final Widget? phone;
  final Widget? tablet;
  final Widget? desktop;
  const DeviceLayout(
      {super.key, this.watch, this.phone, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    Widget body = DeviceType.isDesktop
        ? desktop!
        : DeviceType.isTablet
            ? tablet!
            : DeviceType.isWatch
                ? watch ?? Container()
                : phone ?? Container();
    // debugPrint(
    //     body.runtimeType == Container ? 'No body found' : body.toStringDeep());
    return body;
  }
}
