import 'package:flutter/material.dart';

const codes = {
  "languages": [
    {
      "code": "af",
      "flag": "🇿🇦",
      "dial_code": "+27",
      "name": {"en": "South Africa", "af": "Suid-Afrika"},
      "latitude": -30.5595,
      "longitude": 22.9375,
      "timezone": {"name": "Africa/Johannesburg", "offset": "UTC+02:00"}
    },
    {
      "code": "am",
      "flag": "🇪🇹",
      "dial_code": "+251",
      "name": {"en": "Ethiopia", "am": "ኢትዮጵያ"},
      "latitude": 9.145,
      "longitude": 40.4897,
      "timezone": {"name": "Africa/Addis_Ababa", "offset": "UTC+03:00"}
    },
    {
      "code": "ar",
      "flag": "🇸🇦",
      "dial_code": "+966",
      "name": {"en": "Saudi Arabia", "ar": "المملكة العربية السعودية"},
      "latitude": 23.8859,
      "longitude": 45.0792,
      "timezone": {"name": "Asia/Riyadh", "offset": "UTC+03:00"}
    },
    {
      "code": "az",
      "flag": "🇦🇿",
      "dial_code": "+994",
      "name": {"en": "Azerbaijan", "az": "Azərbaycan"},
      "latitude": 40.1431,
      "longitude": 47.5769,
      "timezone": {"name": "Asia/Baku", "offset": "UTC+04:00"}
    },
    {
      "code": "be",
      "flag": "🇧🇾",
      "dial_code": "+375",
      "name": {"en": "Belarus", "be": "Беларусь"},
      "latitude": 53.7098,
      "longitude": 27.9534,
      "timezone": {"name": "Europe/Minsk", "offset": "UTC+03:00"}
    },
    {
      "code": "bg",
      "flag": "🇧🇬",
      "dial_code": "+359",
      "name": {"en": "Bulgaria", "bg": "България"},
      "latitude": 42.7339,
      "longitude": 25.4858,
      "timezone": {"name": "Europe/Sofia", "offset": "UTC+02:00"}
    },
    {
      "code": "bn",
      "flag": "🇧🇩",
      "dial_code": "+880",
      "name": {"en": "Bangladesh", "bn": "বাংলাদেশ"},
      "latitude": 23.685,
      "longitude": 90.3563,
      "timezone": {"name": "Asia/Dhaka", "offset": "UTC+06:00"}
    },
    {
      "code": "bs",
      "flag": "🇧🇦",
      "dial_code": "+387",
      "name": {"en": "Bosnia and Herzegovina", "bs": "Bosna i Hercegovina"},
      "latitude": 43.9159,
      "longitude": 17.6791,
      "timezone": {"name": "Europe/Sarajevo", "offset": "UTC+02:00"}
    },
    {
      "code": "ca",
      "flag": "🇪🇸",
      "dial_code": "+34",
      "name": {"en": "Spain", "ca": "Espanya"},
      "latitude": 40.4637,
      "longitude": -3.7492,
      "timezone": {"name": "Europe/Madrid", "offset": "UTC+02:00"}
    },
    {
      "code": "cs",
      "flag": "🇨🇿",
      "dial_code": "+420",
      "name": {"en": "Czech Republic", "cs": "Česko"},
      "latitude": 49.8175,
      "longitude": 15.473,
      "timezone": {"name": "Europe/Prague", "offset": "UTC+02:00"}
    },
    {
      "code": "da",
      "flag": "🇩🇰",
      "dial_code": "+45",
      "name": {"en": "Denmark", "da": "Danmark"},
      "latitude": 56.2639,
      "longitude": 9.5018,
      "timezone": {"name": "Europe/Copenhagen", "offset": "UTC+02:00"}
    },
    {
      "code": "de",
      "flag": "🇩🇪",
      "dial_code": "+49",
      "name": {"en": "Germany", "de": "Deutschland"},
      "latitude": 51.1657,
      "longitude": 10.4515,
      "timezone": {"name": "Europe/Berlin", "offset": "UTC+02:00"}
    },
    {
      "code": "el",
      "flag": "🇬🇷",
      "dial_code": "+30",
      "name": {"en": "Greece", "el": "Ελλάδα"},
      "latitude": 39.0742,
      "longitude": 21.8243,
      "timezone": {"name": "Europe/Athens", "offset": "UTC+03:00"}
    },
    {
      "code": "en",
      "flag": "🇺🇸",
      "dial_code": "+1",
      "name": {"en": "United States", "es": "Estados Unidos"},
      "latitude": 37.0902,
      "longitude": -95.7129,
      "timezone": {"name": "America/New_York", "offset": "UTC-05:00"}
    },
    {
      "code": "es",
      "flag": "🇪🇸",
      "dial_code": "+34",
      "name": {"en": "Spain", "es": "España"},
      "latitude": 40.4637,
      "longitude": -3.7492,
      "timezone": {"name": "Europe/Madrid", "offset": "UTC+02:00"}
    },
    {
      "code": "et",
      "flag": "🇪🇪",
      "dial_code": "+372",
      "name": {"en": "Estonia", "et": "Eesti"},
      "latitude": 58.5953,
      "longitude": 25.0136,
      "timezone": {"name": "Europe/Tallinn", "offset": "UTC+03:00"}
    },
    {
      "code": "fa",
      "flag": "🇮🇷",
      "dial_code": "+98",
      "name": {"en": "Iran", "fa": "ایران"},
      "latitude": 32.4279,
      "longitude": 53.688,
      "timezone": {"name": "Asia/Tehran", "offset": "UTC+03:30"}
    },
    {
      "code": "fi",
      "flag": "🇫🇮",
      "dial_code": "+358",
      "name": {"en": "Finland", "fi": "Suomi"},
      "latitude": 61.9241,
      "longitude": 25.7482,
      "timezone": {"name": "Europe/Helsinki", "offset": "UTC+03:00"}
    },
    {
      "code": "fr",
      "flag": "🇫🇷",
      "dial_code": "+33",
      "name": {"en": "France", "fr": "France"},
      "latitude": 46.6034,
      "longitude": 1.8883,
      "timezone": {"name": "Europe/Paris", "offset": "UTC+02:00"}
    },
    {
      "code": "gl",
      "flag": "🇪🇸",
      "dial_code": "+34",
      "name": {"en": "Spain", "gl": "España"},
      "latitude": 40.4637,
      "longitude": -3.7492,
      "timezone": {"name": "Europe/Madrid", "offset": "UTC+02:00"}
    },
    {
      "code": "ha",
      "flag": "🇳🇪",
      "dial_code": "+227",
      "name": {"en": "Niger", "ha": "Nijar"},
      "latitude": 17.6078,
      "longitude": 8.0817,
      "timezone": {"name": "Africa/Niamey", "offset": "UTC+01:00"}
    },
    {
      "code": "he",
      "flag": "🇮🇱",
      "dial_code": "+972",
      "name": {"en": "Israel", "he": "ישראל"},
      "latitude": 31.0461,
      "longitude": 34.8516,
      "timezone": {"name": "Asia/Jerusalem", "offset": "UTC+03:00"}
    },
    {
      "code": "hi",
      "flag": "🇮🇳",
      "dial_code": "+91",
      "name": {"en": "India", "hi": "भारत"},
      "latitude": 20.5937,
      "longitude": 78.9629,
      "timezone": {"name": "Asia/Kolkata", "offset": "UTC+05:30"}
    },
    {
      "code": "hr",
      "flag": "🇭🇷",
      "dial_code": "+385",
      "name": {"en": "Croatia", "hr": "Hrvatska"},
      "latitude": 45.1,
      "longitude": 15.2,
      "timezone": {"name": "Europe/Zagreb", "offset": "UTC+02:00"}
    },
    {
      "code": "hu",
      "flag": "🇭🇺",
      "dial_code": "+36",
      "name": {"en": "Hungary", "hu": "Magyarország"},
      "latitude": 47.1625,
      "longitude": 19.5033,
      "timezone": {"name": "Europe/Budapest", "offset": "UTC+02:00"}
    },
    {
      "code": "hy",
      "flag": "🇦🇲",
      "dial_code": "+374",
      "name": {"en": "Armenia", "hy": "Հայաստան"},
      "latitude": 40.0691,
      "longitude": 45.0382,
      "timezone": {"name": "Asia/Yerevan", "offset": "UTC+04:00"}
    },
    {
      "code": "id",
      "flag": "🇮🇩",
      "dial_code": "+62",
      "name": {"en": "Indonesia", "id": "Indonesia"},
      "latitude": -0.7893,
      "longitude": 113.9213,
      "timezone": {"name": "Asia/Jakarta", "offset": "UTC+07:00"}
    },
    {
      "code": "is",
      "flag": "🇮🇸",
      "dial_code": "+354",
      "name": {"en": "Iceland", "is": "Ísland"},
      "latitude": 64.9631,
      "longitude": -19.0208,
      "timezone": {"name": "Atlantic/Reykjavik", "offset": "UTC+00:00"}
    },
    {
      "code": "it",
      "flag": "🇮🇹",
      "dial_code": "+39",
      "name": {"en": "Italy", "it": "Italia"},
      "latitude": 41.8719,
      "longitude": 12.5674,
      "timezone": {"name": "Europe/Rome", "offset": "UTC+02:00"}
    },
    {
      "code": "ja",
      "flag": "🇯🇵",
      "dial_code": "+81",
      "name": {"en": "Japan", "ja": "日本"},
      "latitude": 36.2048,
      "longitude": 138.2529,
      "timezone": {"name": "Asia/Tokyo", "offset": "UTC+09:00"}
    },
    {
      "code": "kk",
      "flag": "🇰🇿",
      "dial_code": "+7",
      "name": {"en": "Kazakhstan", "kk": "Қазақстан"},
      "latitude": 48.0196,
      "longitude": 66.9237,
      "timezone": {"name": "Asia/Almaty", "offset": "UTC+06:00"}
    },
    {
      "code": "ko",
      "flag": "🇰🇷",
      "dial_code": "+82",
      "name": {"en": "South Korea", "ko": "대한민국"},
      "latitude": 35.9078,
      "longitude": 127.7669,
      "timezone": {"name": "Asia/Seoul", "offset": "UTC+09:00"}
    },
    {
      "code": "lt",
      "flag": "🇱🇹",
      "dial_code": "+370",
      "name": {"en": "Lithuania", "lt": "Lietuva"},
      "latitude": 55.1694,
      "longitude": 23.8813,
      "timezone": {"name": "Europe/Vilnius", "offset": "UTC+03:00"}
    },
    {
      "code": "lv",
      "flag": "🇱🇻",
      "dial_code": "+371",
      "name": {"en": "Latvia", "lv": "Latvija"},
      "latitude": 56.8796,
      "longitude": 24.6032,
      "timezone": {"name": "Europe/Riga", "offset": "UTC+03:00"}
    },
    {
      "code": "mk",
      "flag": "🇲🇰",
      "dial_code": "+389",
      "name": {"en": "North Macedonia", "mk": "Северна Македонија"},
      "latitude": 41.6086,
      "longitude": 21.7453,
      "timezone": {"name": "Europe/Skopje", "offset": "UTC+02:00"}
    },
    {
      "code": "mn",
      "flag": "🇲🇳",
      "dial_code": "+976",
      "name": {"en": "Mongolia", "mn": "Монгол Улс"},
      "latitude": 46.8625,
      "longitude": 103.8467,
      "timezone": {"name": "Asia/Ulaanbaatar", "offset": "UTC+08:00"}
    },
    {
      "code": "ms",
      "flag": "🇲🇾",
      "dial_code": "+60",
      "name": {"en": "Malaysia", "ms": "Malaysia"},
      "latitude": 4.2105,
      "longitude": 101.9758,
      "timezone": {"name": "Asia/Kuala_Lumpur", "offset": "UTC+08:00"}
    },
    {
      "code": "nb",
      "flag": "🇳🇴",
      "dial_code": "+47",
      "name": {"en": "Norway", "nb": "Norge"},
      "latitude": 60.472,
      "longitude": 8.4689,
      "timezone": {"name": "Europe/Oslo", "offset": "UTC+02:00"}
    },
    {
      "code": "nl",
      "flag": "🇳🇱",
      "dial_code": "+31",
      "name": {"en": "Netherlands", "nl": "Nederland"},
      "latitude": 52.1326,
      "longitude": 5.2913,
      "timezone": {"name": "Europe/Amsterdam", "offset": "UTC+02:00"}
    },
    {
      "code": "nn",
      "flag": "🇳🇴",
      "dial_code": "+47",
      "name": {"en": "Norway", "nn": "Noreg"},
      "latitude": 60.472,
      "longitude": 8.4689,
      "timezone": {"name": "Europe/Oslo", "offset": "UTC+02:00"}
    },
    {
      "code": "pl",
      "flag": "🇵🇱",
      "dial_code": "+48",
      "name": {"en": "Poland", "pl": "Polska"},
      "latitude": 51.9194,
      "longitude": 19.1451,
      "timezone": {"name": "Europe/Warsaw", "offset": "UTC+02:00"}
    },
    {
      "code": "pt",
      "flag": "🇵🇹",
      "dial_code": "+351",
      "name": {"en": "Portugal", "pt": "Portugal"},
      "latitude": 39.3999,
      "longitude": -8.2245,
      "timezone": {"name": "Europe/Lisbon", "offset": "UTC+01:00"}
    },
    {
      "code": "ro",
      "flag": "🇷🇴",
      "dial_code": "+40",
      "name": {"en": "Romania", "ro": "România"},
      "latitude": 45.9432,
      "longitude": 24.9668,
      "timezone": {"name": "Europe/Bucharest", "offset": "UTC+03:00"}
    },
    {
      "code": "ru",
      "flag": "🇷🇺",
      "dial_code": "+7",
      "name": {"en": "Russia", "ru": "Россия"},
      "latitude": 61.524,
      "longitude": 105.3188,
      "timezone": {"name": "Europe/Moscow", "offset": "UTC+03:00"}
    },
    {
      "code": "sk",
      "flag": "🇸🇰",
      "dial_code": "+421",
      "name": {"en": "Slovakia", "sk": "Slovensko"},
      "latitude": 48.669,
      "longitude": 19.699,
      "timezone": {"name": "Europe/Bratislava", "offset": "UTC+02:00"}
    },
    {
      "code": "sl",
      "flag": "🇸🇮",
      "dial_code": "+386",
      "name": {"en": "Slovenia", "sl": "Slovenija"},
      "latitude": 46.1512,
      "longitude": 14.9955,
      "timezone": {"name": "Europe/Ljubljana", "offset": "UTC+02:00"}
    },
    {
      "code": "sq",
      "flag": "🇦🇱",
      "dial_code": "+355",
      "name": {"en": "Albania", "sq": "Shqipëria"},
      "latitude": 41.1533,
      "longitude": 20.1683,
      "timezone": {"name": "Europe/Tirane", "offset": "UTC+02:00"}
    },
    {
      "code": "sr",
      "flag": "🇷🇸",
      "dial_code": "+381",
      "name": {"en": "Serbia", "sr": "Србија"},
      "latitude": 44.0165,
      "longitude": 21.0059,
      "timezone": {"name": "Europe/Belgrade", "offset": "UTC+02:00"}
    },
    {
      "code": "sv",
      "flag": "🇸🇪",
      "dial_code": "+46",
      "name": {"en": "Sweden", "sv": "Sverige"},
      "latitude": 60.1282,
      "longitude": 18.6435,
      "timezone": {"name": "Europe/Stockholm", "offset": "UTC+02:00"}
    },
    {
      "code": "ta",
      "flag": "🇱🇰",
      "dial_code": "+94",
      "name": {"en": "Sri Lanka", "ta": "இலங்கை"},
      "latitude": 7.8731,
      "longitude": 80.7718,
      "timezone": {"name": "Asia/Colombo", "offset": "UTC+05:30"}
    },
    {
      "code": "th",
      "flag": "🇹🇭",
      "dial_code": "+66",
      "name": {"en": "Thailand", "th": "ประเทศไทย"},
      "latitude": 15.870,
      "longitude": 100.9925,
      "timezone": {"name": "Asia/Bangkok", "offset": "UTC+07:00"}
    },
    {
      "code": "tr",
      "flag": "🇹🇷",
      "dial_code": "+90",
      "name": {"en": "Turkey", "tr": "Türkiye"},
      "latitude": 38.9637,
      "longitude": 35.2433,
      "timezone": {"name": "Europe/Istanbul", "offset": "UTC+03:00"}
    },
    {
      "code": "uk",
      "flag": "🇺🇦",
      "dial_code": "+380",
      "name": {"en": "Ukraine", "uk": "Україна"},
      "latitude": 48.3794,
      "longitude": 31.1656,
      "timezone": {"name": "Europe/Kiev", "offset": "UTC+03:00"}
    },
    {
      "code": "ur",
      "flag": "🇵🇰",
      "dial_code": "+92",
      "name": {"en": "Pakistan", "ur": "پاکستان"},
      "latitude": 30.3753,
      "longitude": 69.3451,
      "timezone": {"name": "Asia/Karachi", "offset": "UTC+05:00"}
    },
    {
      "code": "uz",
      "flag": "🇺🇿",
      "dial_code": "+998",
      "name": {"en": "Uzbekistan", "uz": "Oʻzbekiston"},
      "latitude": 41.3775,
      "longitude": 64.5853,
      "timezone": {"name": "Asia/Tashkent", "offset": "UTC+05:00"}
    },
    {
      "code": "vi",
      "flag": "🇻🇳",
      "dial_code": "+84",
      "name": {"en": "Vietnam", "vi": "Việt Nam"},
      "latitude": 14.0583,
      "longitude": 108.2772,
      "timezone": {"name": "Asia/Ho_Chi_Minh", "offset": "UTC+07:00"}
    },
    {
      "code": "zh",
      "flag": "🇨🇳",
      "dial_code": "+86",
      "name": {"en": "China", "zh": "中国"},
      "latitude": 35.8617,
      "longitude": 104.1954,
      "timezone": {"name": "Asia/Shanghai", "offset": "UTC+08:00"}
    }
  ]
};

///* Country Model
class Country {
  final String code;
  final String flag;
  final String dialCode;
  final Map<String, String> name;
  final double latitude;
  final double longitude;
  final Map<String, String> timezone;
  Country({
    required this.code,
    required this.flag,
    required this.dialCode,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });
}

///* Language JSON
class CountryCodes {
  final List<Country> languages;

  CountryCodes({required this.languages});

  factory CountryCodes.fromJson(Map<String, dynamic> json) {
    List<Country> languages = List<Country>.from(
      json["languages"].map(
        (x) => Country(
          code: x["code"],
          flag: x["flag"],
          dialCode: x["dial_code"],
          name: x["name"],
          latitude: x["latitude"],
          longitude: x["longitude"],
          timezone: x["timezone"],
        ),
      ),
    );
    return CountryCodes(languages: languages);
  }
}

class CountryPicker extends StatefulWidget {
  final double padding, borderRadius, borderWidth;
  final bool showBorder, showDropdownIcon, showFlag;
  final Color focusBorderColor, unFocusBorderColor;
  final BoxBorder? customBorder;
  final Widget? widgetBetweenFlagAndTitle;

  final double menuBorderRadius, elevation;
  final bool showCountryCode, showSearch, showMenuFlag;
  final Color? menuColor, searchFieldColor, menuShadowColor;
  final EdgeInsetsGeometry? menuPadding, menuMargin;
  final Function(Country) onChanged;

  const CountryPicker({
    Key? key,
    this.padding = 12.0,
    this.borderWidth = 1.0,
    this.borderRadius = 15.0,
    this.showBorder = true,
    this.showDropdownIcon = true,
    this.showFlag = true,
    this.focusBorderColor = Colors.pink,
    this.unFocusBorderColor = Colors.grey,
    this.customBorder,
    this.widgetBetweenFlagAndTitle,
    this.menuPadding,
    this.menuMargin,
    this.menuBorderRadius = 16,
    this.showCountryCode = true,
    this.showSearch = true,
    this.showMenuFlag = true,
    this.menuColor,
    this.searchFieldColor,
    this.elevation = 0,
    this.menuShadowColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  CountryCodes? countryCodes;
  Country? selectedLanguage;
  String searchQuery = '';
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    countryCodes =
        CountryCodes.fromJson(codes); // Initialize your country codes data here
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
          _overlayEntry = null;
        } else {
          _showOverlay(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.showBorder
              ? widget.customBorder ??
                  Border.all(
                    color: _overlayEntry != null
                        ? widget.focusBorderColor
                        : widget.unFocusBorderColor,
                    width: widget.borderWidth,
                  )
              : null,
        ),
        child: Row(
          children: [
            if (selectedLanguage != null && widget.showFlag)
              Text(selectedLanguage!.flag),
            if (selectedLanguage != null)
              widget.widgetBetweenFlagAndTitle ?? const SizedBox(width: 10),
            Text(selectedLanguage?.name["en"] ?? 'Select a language'),
            const Spacer(),
            if (widget.showDropdownIcon)
              Icon(
                _overlayEntry != null
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                size: 24.0,
                color: _overlayEntry != null
                    ? widget.focusBorderColor
                    : widget.unFocusBorderColor,
              ),
          ],
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          setState(() {});
        },
        child: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy + size.height,
              width: size.width,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          widget.menuMargin ?? const EdgeInsets.only(top: 6),
                      padding: widget.menuPadding,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.menuBorderRadius),
                        border: widget.elevation == 0
                            ? Border.all(
                                color: widget.focusBorderColor,
                                width: widget.borderWidth,
                              )
                            : null,
                        color: widget.menuColor ?? Colors.white,
                        boxShadow: widget.elevation > 0
                            ? [
                                BoxShadow(
                                  color: widget.menuShadowColor ?? Colors.grey,
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.showSearch)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchQuery = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        widget.borderRadius),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).dividerColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        widget.borderRadius),
                                    borderSide: BorderSide(
                                      color: widget.focusBorderColor,
                                      width: widget.borderWidth,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: widget.searchFieldColor ??
                                      Theme.of(context).cardColor,
                                  prefixIcon: const Icon(Icons.search),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: searchQuery.isEmpty
                                  ? countryCodes?.languages.length ?? 0
                                  : filteredLanguages.length,
                              itemBuilder: (context, index) {
                                final language = searchQuery.isEmpty
                                    ? countryCodes?.languages[index]
                                    : filteredLanguages[index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = language;
                                      widget.onChanged(language);
                                      _overlayEntry?.remove();
                                      _overlayEntry = null;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 12.0),
                                    child: Row(
                                      children: [
                                        Visibility(
                                          visible: widget.showMenuFlag,
                                          child: Row(
                                            children: [
                                              Text(language!.flag),
                                              const SizedBox(width: 8.0),
                                            ],
                                          ),
                                        ),
                                        Text(language.name["en"] ?? ""),
                                        Visibility(
                                          visible: widget.showCountryCode,
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 8.0),
                                              Text(language.dialCode),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  List<Country> get filteredLanguages {
    if (searchQuery.isEmpty) {
      return countryCodes?.languages ?? [];
    } else {
      return countryCodes?.languages
              .where(
                (language) =>
                    language.name["en"]
                        ?.toLowerCase()
                        .contains(searchQuery.toLowerCase()) ??
                    false,
              )
              .toList() ??
          [];
    }
  }
}
