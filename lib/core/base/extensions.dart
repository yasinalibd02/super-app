part of 'app_core.dart';

/*
 * Align 
 * EdgeInsets
 * TextStyle
 */

extension SupperAlignment on Widget {
  //-> Align
  get center => Alignment.center;
  get topLeft => Alignment.topLeft;
  get topRight => Alignment.topRight;
  get topCenter => Alignment.topCenter;
  get centerLeft => Alignment.centerLeft;
  get bottomLeft => Alignment.bottomLeft;
  get centerRight => Alignment.centerRight;
  get bottomRight => Alignment.bottomRight;
  get bottomCenter => Alignment.bottomCenter;

  get mainEnd => MainAxisAlignment.end;
  get mainStart => MainAxisAlignment.start;
  get mainCenter => MainAxisAlignment.center;
  get spaceAround => MainAxisAlignment.spaceAround;
  get spaceEvenly => MainAxisAlignment.spaceEvenly;
  get spaceBetween => MainAxisAlignment.spaceBetween;

  get crossEnd => CrossAxisAlignment.end;
  get crossStart => CrossAxisAlignment.start;
  get crossCenter => CrossAxisAlignment.center;
  get crossStretch => CrossAxisAlignment.stretch;
  get crossBaseline => CrossAxisAlignment.baseline;

  get mainMin => MainAxisSize.min;
}

//-> EdgeInsets
extension SuperEdgeInsets on EdgeInsets {
  EdgeInsets sv() {
    return copyWith(
      top: top + AppSize.padding.top,
      bottom: bottom + AppSize.padding.bottom,
    );
  }

  EdgeInsets st() {
    return copyWith(top: top + AppSize.padding.top);
  }

  EdgeInsets sb() {
    return copyWith(bottom: bottom + AppSize.padding.bottom);
  }
}

//-> TextStyle
extension SupperTextStyle on TextStyle {
  TextStyle w(int i) {
    FontWeight w = FontWeight.w400;
    switch (i) {
      case 3:
        {
          w = FontWeight.w300;
        }
        break;
      case 5:
        {
          w = FontWeight.w500;
        }
        break;
      case 6:
        {
          w = FontWeight.w600;
        }
        break;
      case 7:
        {
          w = FontWeight.w700;
        }
        break;
    }
    return copyWith(fontWeight: w);
  }

  TextStyle size(double s) {
    return copyWith(fontSize: s.fontSize);
  }

  TextStyle clr(Color? color) {
    return copyWith(color: color);
  }

  TextStyle tsc([num multiplier = 1.0]) {
    return copyWith(fontSize: fontSize! * multiplier);
  }
}

extension TimeOnly on String {
  String get timeFormat {
    return DateFormat('hh:mm a').format(DateTime.parse(this));
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey(
  debugLabel: 'Main Navigator',
);

extension SupperShape on double {
  get shapeBorderRadius =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(this));
  get radiusAll => BorderRadius.circular(this);
}

extension DateFormer on DateTime {
  get amOrPM => DateFormat.jm().format(this);
  get formatDate => DateFormat('dd MMM, yyyy').format(this);

  get formatTime => DateFormat('EEEE, hh:mm a').format(this);
  get formatTimeOnly => DateFormat('hh:mm a').format(this);
}

extension ArabicNumberFormat on num {
  String formatAsArabic() {
    var format = NumberFormat.decimalPattern('ar');
    return format.format(this);
  }
}

extension NumberConversion on String {
  static const Map<String, String> _englishToBanglaDigits = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  String get toBanglaNumber {
    String banglaNumber = '';
    for (int i = 0; i < length; i++) {
      String digit = this[i];
      banglaNumber += _englishToBanglaDigits[digit] ?? digit;
    }
    return banglaNumber;
  }
}

extension BarcodeExtensions on String {
  // Method to get the Region Code (first 3 digits)
  String getRegionCode() {
    // if (length != 13) {
    //   throw ArgumentError('Barcode must be exactly 13 digits long');
    // }
    return substring(0, 3);
  }

  // Method to get the Brand Code (next 6 digits after skipping the first digit)
  String getBrandCode() {
    // if (length != 13) {
    //   throw ArgumentError('Barcode must be exactly 13 digits long');
    // }
    return substring(1, 7);
  }

  // Method to get the Serial Number (remaining digits)
  String getSerialNumber() {
    // if (length != 13) {
    //   throw ArgumentError('Barcode must be exactly 13 digits long');
    // }
    return substring(7);
  }
}
