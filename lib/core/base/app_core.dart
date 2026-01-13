import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get_storage/get_storage.dart';

export '../../core/base/themes.dart';
// export '../../languages/strings.dart';

part 'base.dart';
part 'colors.dart';
part 'devices.dart';
part 'extensions.dart';
part 'ratio.dart';
part 'size.dart';
part 'space.dart';
part 'style.dart';

class AppCore {
  static init(context) {
    AppRatio.init(context);
    AppSize.init(context);
    DeviceType.init(context);
    AppColors.init(context);
    Space.init();
    AppStyle.init();
  }
}
