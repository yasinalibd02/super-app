import '../base/app_core.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final Widget? child;
  final double? radius, elevation;
  final List<PopupItemModel> items;
  const CustomPopupMenuButton({
    super.key,
    this.child,
    this.radius,
    this.elevation,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radius * 1.5),
      ),
      itemBuilder: (BuildContext context) {
        return List.generate(
          items.length,
          (i) => PopupMenuItem(
            onTap: items[i].onTap,
            child: Text(items[i].label),
          ),
        );
      },
      child: child,
    );
  }
}

class PopupItemModel {
  final String label;
  final VoidCallback onTap;
  PopupItemModel({required this.label, required this.onTap});
}
