import '../base/app_core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.centerTitle = false,
    this.isWhite = false,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
    this.titleColor,
    this.leadingWidth,
  });

  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final bool isWhite;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: AppStyle.appBarTextStyle.clr(titleColor),
      ),
      actions: action,
      leading: showBackButton
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: leading ??
                  Row(
                    mainAxisSize: mainMin,
                    children: [
                      Space.width.add(AppSize.horizontal * 0.666666667),
                      Container(
                        padding: Space.all.a10 * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F2F2),
                          borderRadius: BorderRadius.circular(AppSize.radius),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: AppSize.iconSize.m * 0.85,
                        ),
                      ),
                    ],
                  ),
            )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? const Color(0xffF6F7F7),
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarSize ?? AppSize.appBarHeight);
}
