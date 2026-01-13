// import 'dart:math';
// import 'package:flutter/material.dart';

// class CustomDivider extends StatelessWidget {
//   final double width;
//   final Color? color;
//   final double spacing;
//   final double size;
//   final double radius;
//   final Gradient? gradient;
//   final bool isVertical;
//   final DividerStyle dividerStyle;

//   const CustomDivider({
//     super.key,
//     this.width = 2.0,
//     this.color,
//     this.spacing = 6,
//     this.size = 1.0,
//     this.radius = 10.0,
//     this.gradient,
//     this.isVertical = false,
//     this.dividerStyle = DividerStyle.none,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size,
//       child: LayoutBuilder(
//         builder: (_, BoxConstraints constraints) {
//           return _dividerBuilderWidget(_, constraints);
//         },
//       ),
//     );
//   }

//   ///* Divider Builder
//   _dividerBuilderWidget(_, BoxConstraints constraints) {
//     final double maxBoxWidth = constraints.maxWidth;
//     final double dotSpacing = spacing + size;
//     final double dashSpacing = (spacing * 2) + size;
//     final int numDots = ((maxBoxWidth / dotSpacing) + 1).floor();
//     final int numDashes = ((maxBoxWidth / dashSpacing) + 1).floor();
//     final int length = dividerStyle == DividerStyle.dot ? numDots : numDashes;
//     final Color? dC =
//         gradient != null ? null : color ?? Theme.of(_).dividerColor;

//     return dividerStyle == DividerStyle.none
//         ? _simpleDividerWidget(_, dC)
//         : Transform.rotate(
//             angle: isVertical ? pi / 2 : 0,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: List.generate(
//                 length,
//                 (index) => _dividerWidget(_, dC),
//               ),
//             ),
//           );
//   }

//   ///* Divider Widget
//   _dividerWidget(BuildContext context, dividerColor) {
//     final bool isDotStyle = dividerStyle == DividerStyle.dot;
//     final double dotSpacing = spacing + size;
//     final double dashSpacing = (spacing * 2) + size;
//     final EdgeInsetsGeometry margin =
//         EdgeInsets.only(right: isDotStyle ? dotSpacing : dashSpacing);
//     final Decoration decoration = BoxDecoration(
//       shape: isDotStyle ? BoxShape.circle : BoxShape.rectangle,
//       color: dividerColor,
//       gradient: gradient,
//       borderRadius: isDotStyle ? null : BorderRadius.circular(radius),
//     );

//     return Container(
//       width: width,
//       margin: margin,
//       decoration: decoration,
//     );
//   }

//   _simpleDividerWidget(BuildContext context, dividerColor) {
//     final bool isDotStyle = dividerStyle == DividerStyle.dot;
//     return Container(
//       width: isVertical ? width : MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: dividerColor,
//         gradient: gradient,
//         borderRadius: isDotStyle ? null : BorderRadius.circular(radius),
//       ),
//     );
//   }
// }

// enum DividerStyle { dot, dash, none }
