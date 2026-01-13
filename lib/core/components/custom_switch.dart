// import 'package:template/core/base/app_core.dart';
// import 'package:template/core/components/components.dart';
// import 'package:template/core/utils/assets.dart';
// import 'package:flutter/material.dart';
//

// class SwitchController extends ChangeNotifier {
//   // Initial value for the switch
//   RxBool isYesSelected = true.obs;

//   // Toggle the switch value
//   void toggleSwitch() {
//     isYesSelected.value = !isYesSelected.value;
//   }
// }

// class CustomSwitch extends StatelessWidget {
//   CustomSwitch({
//     super.key,
//     required this.sunnahPrayed,
//   });
//   final SwitchController controller = Get.put(SwitchController());
//   final int sunnahPrayed;
//   @override
//   Widget build(BuildContext context) {
//     if (sunnahPrayed == 0) {
//       controller.isYesSelected.value = false;
//     } else {
//       controller.isYesSelected.value = true;
//     }

//     return Obx(
//       () => Row(
//         children: [
//           // Yes option
//           CustomContainer(
//             expanded: true,
//             showBorder: true,
//             customBorderRadius: BorderRadius.only(
//               topLeft: Radius.circular(AppSize.radius),
//               bottomLeft: Radius.circular(AppSize.radius),
//             ),
//             customBorder: Border(
//               right: BorderSide.none,
//               top: BorderSide(color: Colors.grey.shade400),
//               left: BorderSide(color: Colors.grey.shade400),
//               bottom: BorderSide(color: Colors.grey.shade400),
//             ),
//             onTap: () {
//               if (!controller.isYesSelected.value) {
//                 controller.toggleSwitch();
//               }
//             },
//             color: controller.isYesSelected.value
//                 ? Colors.grey.shade300
//                 : Colors.transparent,
//             customPadding: Space.vertical.v15,
//             child: Row(
//               mainAxisAlignment: mainCenter,
//               children: [
//                 const CustomIcon(
//                   Assets.complete,
//                   color: Colors.green,
//                 ),
//                 CustomText(
//                   'Strings.read',
//                   style: AppStyle.title2,
//                   customPadding: Space.horizontal.h10,
//                 ),
//               ],
//             ),
//           ),
//           // No option
//           CustomContainer(
//             onTap: () {
//               if (controller.isYesSelected.value) {
//                 controller.toggleSwitch();
//               }
//             },
//             color: !controller.isYesSelected.value
//                 ? Colors.grey.shade300
//                 : Colors.transparent,
//             expanded: true,
//             showBorder: true,
//             borderColor: Colors.grey,
//             customPadding: Space.vertical.v15,
//             customBorderRadius: BorderRadius.only(
//               topRight: Radius.circular(AppSize.radius),
//               bottomRight: Radius.circular(AppSize.radius),
//             ),
//             child: Row(
//               mainAxisAlignment: mainCenter,
//               children: [
//                 const CustomIcon(
//                   Assets.notComplete,
//                   color: Colors.red,
//                 ),
//                 CustomText(
//                   'Strings.notRead',
//                   style: AppStyle.title2,
//                   customPadding: Space.horizontal.h10,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
