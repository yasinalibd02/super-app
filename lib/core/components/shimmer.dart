import 'dart:math';

import 'package:shimmer/shimmer.dart';

import '../base/app_core.dart';
import 'components.dart';

Widget productsShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: CustomContainer(
      color: Colors.white,
      borderRadius: AppSize.radius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
            expanded: true,
            customBorderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.radius),
              topLeft: Radius.circular(AppSize.radius),
            ),
            color: Colors.transparent,
            // imagePath: controller.filteredBoycottList[index].image!,
          ),
          CustomContainer(
            customBorderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppSize.radius),
              bottomLeft: Radius.circular(AppSize.radius),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    '',
                    color: Colors.white,
                    customMargin:
                        Space.vertical.v10 * 0.8 + Space.horizontal.h15,
                    typo: Typo.ls,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class ChatsShimmer extends StatefulWidget {
  const ChatsShimmer({super.key});

  @override
  _ChatsShimmerState createState() => _ChatsShimmerState();
}

class _ChatsShimmerState extends State<ChatsShimmer> {
  final Random _random = Random();

  // Method to generate a random width
  double _getRandomWidth() {
    return _random.nextDouble() * 0.6 +
        0.4; // Random width between 40% and 100%
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: Space.horizontal.d,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const CustomPaintCircleAvatar(
                  //   userId: 'test',
                  // ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(2, (i) {
                        double randomWidth =
                            _getRandomWidth(); // Generate random width
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                randomWidth, // Random width
                            height: 12, // Fixed height for shimmer lines
                            color: Colors
                                .grey.shade300, // Placeholder color for shimmer
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
