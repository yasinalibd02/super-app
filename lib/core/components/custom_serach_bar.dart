import '../../app/import.dart';
import '../../assets/assets.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onBackPress;
  final VoidCallback? onOptionsPress;
  final String? text;
  final String? icon;
  final double? iconHeight;

  const SearchFieldWidget(
      {super.key,
      this.text,
      this.controller,
      this.onBackPress,
      this.onOptionsPress,
      this.icon,
      this.iconHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.horizontal.h15,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColors.black.withValues(alpha: 0.1)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.radius),
        ),
        child: Padding(
          padding: Space.left.l10,
          child: Row(
            mainAxisAlignment: mainEnd,
            children: [
              Expanded(
                child: TextField(
                  cursorColor: AppColors.black,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: text ?? "Search",
                    hintStyle: TextStyle(
                        color: AppColors.black.withValues(alpha: 0.3),
                        fontSize: AppSize.fontSize.bm,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: Space.all.a10,
                      child: CustomIcon(
                        icon ?? Assets.icons.search,
                        height: iconHeight ?? AppSize.iconSize.m * 1.1,
                        color: AppColors.black.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
