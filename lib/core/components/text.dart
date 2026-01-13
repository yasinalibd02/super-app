import '../base/app_core.dart';

String getFontFamily(GoogleFontFamily fontFamily) {
  switch (fontFamily) {
    case GoogleFontFamily.roboto:
      return 'Roboto';
    case GoogleFontFamily.openSans:
      return 'Open Sans';
    case GoogleFontFamily.lato:
      return 'Lato';
    case GoogleFontFamily.montserrat:
      return 'Montserrat';
    // Add more cases here as needed
    default:
      return 'Roboto';
  }
}

class CustomText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight fontWeight;
  final double padding;
  final EdgeInsets? customPadding;
  final double margin;
  final EdgeInsets? customMargin;
  final Color? color;
  final bool primaryColor;
  final Color? hoverColor;
  final GoogleFontFamily fontFamily;
  final int maxLines;
  final TextAlign? textAlign;
  final double wordSpacing;
  final double letterSpacing;
  final double opacity;
  final TextOverflow overflow;
  final TextBaseline? textBaseline;
  final Typo? typo;
  final TextDecoration? textDecoration;
  final TextStyle? style;
  final VoidCallback? onClick, onLongPress, onDoubleTap;
  final bool expanded;
  final int flex;
  final List<InlineSpan>? children;
  final String? searchTerm; // New parameter for search term

  const CustomText(
    this.text, {
    Key? key,
    this.size,
    this.color,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.fontWeight = FontWeight.w400,
    this.wordSpacing = 0,
    this.opacity = 1,
    this.letterSpacing = 0,
    this.textBaseline,
    this.textDecoration,
    this.style,
    this.textAlign,
    this.typo,
    this.expanded = false,
    this.primaryColor = false,
    this.fontFamily = GoogleFontFamily.roboto,
    this.hoverColor,
    this.padding = 0,
    this.customPadding,
    this.margin = 0,
    this.flex = 1,
    this.customMargin,
    this.children,
    this.searchTerm, // Initialize searchTerm
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  /// set bool value for change hover color
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    AppCore.init(context);

    ///* GoogleFonts.getFont
    var coreTextStyle = TextStyle(
      ///* getFontFamily(fontFamily),
      fontSize: widget.size,
      fontWeight: widget.fontWeight,
      color: isHovering
          ? widget.hoverColor
          : widget.color ??
              widget.hoverColor ??
              (widget.primaryColor
                  ? Theme.of(context).primaryColor
                  : AppColors.textColor),
      wordSpacing: widget.wordSpacing,
      letterSpacing: widget.letterSpacing,
      textBaseline: widget.textBaseline,
      decoration: widget.textDecoration,
    );

    return widget.expanded
        ? Expanded(
            flex: widget.flex,
            child: widget.hoverColor == null
                ? _textWidget(coreTextStyle)
                : _mouseRegion(_textWidget(coreTextStyle)),
          )
        : widget.hoverColor == null
            ? _textWidget(coreTextStyle)
            : _mouseRegion(_textWidget(coreTextStyle));
  }

  ///* MouseRegion change color on hover
  _mouseRegion(Widget child) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: child,
    );
  }

  _textWidget(TextStyle coreTextStyle) {
    return InkWell(
      onTap: widget.onClick,
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      child: Container(
        padding: widget.customPadding ?? EdgeInsets.all(widget.padding),
        margin: widget.customMargin ?? EdgeInsets.all(widget.margin),
        child: Opacity(
          opacity: widget.opacity,
          child: Text.rich(
            _highlightOccurrences(
              widget.text,
              widget.searchTerm,
              widget.style ?? switchStyle(coreTextStyle),
            ),
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            overflow: widget.overflow,
            style: widget.style ?? switchStyle(coreTextStyle),
          ),
        ),
      ),
    );
  }

  TextSpan _highlightOccurrences(
      String text, String? searchTerm, TextStyle style) {
    if (searchTerm == null || searchTerm.isEmpty) {
      return TextSpan(text: text, style: style);
    }

    final RegExp regex = RegExp(searchTerm, caseSensitive: false);
    final List<TextSpan> children = [];
    int start = 0;

    regex.allMatches(text).forEach((match) {
      if (match.start != start) {
        children.add(
            TextSpan(text: text.substring(start, match.start), style: style));
      }
      children.add(TextSpan(
        text: match.group(0),
        style: style.copyWith(
            backgroundColor: Colors.yellow,
            color: Colors.red,
            fontWeight: FontWeight.bold), // Highlight style
      ));
      start = match.end;
    });

    if (start < text.length) {
      children.add(TextSpan(text: text.substring(start), style: style));
    }

    return TextSpan(children: children);
  }

  TextStyle switchStyle(TextStyle coreTextStyle) { 
    switch (widget.typo) {
      case Typo.dl:
        return coreTextStyle.copyWith(fontSize: (57.0));
      case Typo.dm:
        return coreTextStyle.copyWith(fontSize: (45.0));
      case Typo.ds:
        return coreTextStyle.copyWith(fontSize: (36.0));

      case Typo.hl:
        return coreTextStyle.copyWith(fontSize: (32.0));
      case Typo.hm:
        return coreTextStyle.copyWith(fontSize: (28.0));
      case Typo.hs:
        return coreTextStyle.copyWith(fontSize: (24.0));

      case Typo.tl:
        return coreTextStyle.copyWith(fontSize: (22.0));
      case Typo.tm:
        return coreTextStyle.copyWith(fontSize: (16.0));
      case Typo.ts:
        return coreTextStyle.copyWith(fontSize: (14.0));

      case Typo.ll:
        return coreTextStyle.copyWith(fontSize: (14.0));
      case Typo.lm:
        return coreTextStyle.copyWith(fontSize: (12.0));
      case Typo.ls:
        return coreTextStyle.copyWith(fontSize: (11.0));

      case Typo.bl:
        return coreTextStyle.copyWith(fontSize: (16.0));
      case Typo.bm:
        return coreTextStyle.copyWith(fontSize: (14.0));
      case Typo.bs:
        return coreTextStyle.copyWith(fontSize: (12.0));

      default:
        return coreTextStyle;
    }
  }
}

///* ENUM VALUES [Typo]
enum Typo { dl, dm, ds, hl, hm, hs, tl, tm, ts, ll, lm, ls, bl, bm, bs }

///* ENUM VALUES [GoogleFontFamily]
enum GoogleFontFamily { roboto, openSans, lato, montserrat, inter }
