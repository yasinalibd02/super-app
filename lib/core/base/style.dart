part of 'app_core.dart';

class AppStyle {
  static late TextStyle appBarTextStyle;
  static late TextStyle inputFieldHintStyle;
  static late TextStyle inputFieldTextStyle;
  static late TextStyle heading;
  static late TextStyle title;
  static late TextStyle title2;
  static late TextStyle label;
  static late BorderRadius borderRadiusOnlyTop;
  static late BorderRadius borderRadiusOnlyBottom;
  static late BorderRadius senderMessage;
  static late BorderRadius receiverMessage;

  static init() {
    // const bold = FontWeight.w600;
    const core = TextStyle(
      fontFamily: 'Hind Siliguri',
    );

    appBarTextStyle = core.copyWith(
      fontSize: AppSize.fontSize.tm * 1.125,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    );
    inputFieldHintStyle = core.copyWith(
      fontSize: AppSize.fontSize.bm,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor.withValues(alpha: 0.2),
    );
    inputFieldTextStyle = core.copyWith(
      fontSize: AppSize.fontSize.bl,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor.withValues(alpha: 0.2),
    );
    heading = core.copyWith(
      fontSize: AppSize.fontSize.hs - 3.5,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    );
    title = core.copyWith(
      fontSize: AppSize.fontSize.tm * 1.2,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor,
    );
    title2 = core.copyWith(
      fontSize: AppSize.fontSize.tm * 1.1,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor,
    );
    label = core.copyWith(
      fontSize: AppSize.fontSize.ll,
      fontWeight: FontWeight.w300,
      color: AppColors.textColor,
    );

    borderRadiusOnlyTop = BorderRadius.only(
      topLeft: Radius.circular(AppSize.radius * 3),
      topRight: Radius.circular(AppSize.radius * 3),
    );
    borderRadiusOnlyBottom = BorderRadius.only(
      bottomLeft: Radius.circular(AppSize.radius * 3),
      bottomRight: Radius.circular(AppSize.radius * 3),
    );
    senderMessage = BorderRadius.only(
      bottomLeft: Radius.circular(AppSize.radius * 2.5),
      topLeft: Radius.circular(AppSize.radius * 2.5),
      topRight: Radius.circular(AppSize.radius * 2.5),
    );
    receiverMessage = BorderRadius.only(
      bottomRight: Radius.circular(AppSize.radius * 2.5),
      topLeft: Radius.circular(AppSize.radius * 2.5),
      topRight: Radius.circular(AppSize.radius * 2.5),
    );
  }
}
