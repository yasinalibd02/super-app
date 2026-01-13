// // ignore_for_file: library_private_types_in_public_api

// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:flutter/material.dart';

// import 'text.dart';

// class SettingsIndicator extends StatefulWidget {
//   final Widget child;
//   final Future<void> Function() onRefresh;

//   const SettingsIndicator(
//       {Key? key, required this.child, required this.onRefresh})
//       : super(key: key);

//   @override
//   _SettingsIndicatorState createState() => _SettingsIndicatorState();
// }

// class _SettingsIndicatorState extends State<SettingsIndicator>
//     with SingleTickerProviderStateMixin {
//   static const _indicatorSize = 40.0;

//   // IndicatorState? _prevState;
//   late AnimationController _spoonController;
//   // static final _spoonTween = CurveTween(curve: Curves.easeInOut);

//   @override
//   void initState() {
//     _spoonController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomRefreshIndicator(
//       offsetToArmed: _indicatorSize,
//       onRefresh: widget.onRefresh,
//       child: widget.child,
//       builder: (
//         BuildContext context,
//         Widget child,
//         IndicatorController controller,
//       ) {
//         return Stack(
//           children: <Widget>[
//             AnimatedBuilder(
//               animation: controller,
//               builder: (BuildContext context, Widget? _) {
//                 return SizedBox(
//                   height: controller.value * _indicatorSize,
//                   child: Container(
//                     alignment: Alignment.center,
//                     color: Colors.transparent,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.settings,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 10),
//                           // DefaultTextStyle(
//                           //   style: TextStyle(
//                           //     fontSize: 16,
//                           //     color: Theme.of(context).scaffoldBackgroundColor,
//                           //   ),
//                           //   child: AnimatedTextKit(
//                           //     animatedTexts: [
//                           //       WavyAnimatedText('Settings'),
//                           //     ],
//                           //     isRepeatingAnimation: true,
//                           //     repeatForever: true,
//                           //   ),
//                           // ),

//                           const CustomText('Settings'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             AnimatedBuilder(
//               builder: (context, _) {
//                 return Transform.translate(
//                   offset: Offset(0.0, controller.value * _indicatorSize),
//                   child: child,
//                 );
//               },
//               animation: controller,
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _spoonController.dispose();
//     super.dispose();
//   }
// }
