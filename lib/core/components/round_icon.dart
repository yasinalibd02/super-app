import '../base/app_core.dart';

class RoundIcon extends StatelessWidget {
  final dynamic icon;
  const RoundIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.radius),
        color: AppColors.primaryColor.withValues(alpha: 0.09),
      ),
      child: Padding(
        padding: Space.all.a5 * 1.1,
        child: Center(
          child: Image.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
