// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base/app_core.dart';

/// This widget depends on:
///  Svg image package [SvgPicture]
class CustomIcon extends StatelessWidget {
  final dynamic iconData;
  final Function()? onTap;
  final Color? color;
  final double height, width, opacity;
  final EdgeInsets? padding;
  final bool primaryColor;

  const CustomIcon(
    this.iconData, {
    super.key,
    this.onTap,
    this.padding,
    this.color,
    this.height = 24.0,
    this.width = 24.0,
    this.opacity = 1.0,
    this.primaryColor = false,
  });

  _IconType get iconType {
    if (iconData is IconData) return _IconType.material;
    if (iconData is String) {
      if (iconData.startsWith("http://") || iconData.startsWith("https://")) {
        return _IconType.network;
      }
      if (iconData.contains("</svg>")) {
        return _IconType.svgString;
      }
      if (iconData.endsWith(".svg")) {
        return _IconType.svgAsset;
      }
      return _IconType.asset;
    }
    return _IconType.asset;
  }

  @override
  Widget build(BuildContext context) {
    return iconData != ""
        ? Opacity(
            opacity: opacity,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: onTap,
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: _iconWidget(context),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _iconWidget(BuildContext context) {
    return switchIcon(context);
  }

  Widget switchIcon(BuildContext context) {
    switch (iconType) {
      case _IconType.material:
        return _material(context);
      case _IconType.svgString:
        return _svgString(context);
      case _IconType.svgAsset:
        return _svgAsset(context);
      case _IconType.network:
        return _network();
      default:
        return _asset();
    }
  }

  Widget _svgString(BuildContext context) {
    return SvgPicture.string(
      iconData,
      height: height,
      width: width,
      color: primaryColor ? Theme.of(context).primaryColor : color,
    );
  }

  Widget _svgAsset(BuildContext context) {
    return SvgPicture.asset(
      iconData,
      height: height,
      width: width,
      color: primaryColor ? Theme.of(context).primaryColor : color,
    );
  }

  Widget _asset() {
    return Image.asset(
      iconData,
      height: height,
      width: width,
      color: color,
    );
  }

  Widget _material(BuildContext context) {
    return Icon(
      iconData,
      size: height,
      color: primaryColor ? Theme.of(context).primaryColor : color,
    );
  }

  Widget _network() {
    return Image.network(
      iconData,
      height: height,
      width: width,
      color: color,
    );
  }
}

enum _IconType { material, svgString, svgAsset, network, asset }
