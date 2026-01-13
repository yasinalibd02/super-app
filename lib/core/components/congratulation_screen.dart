import '../../app/import.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({
    super.key,
    required this.subTitleString,
    this.subTitle,
    this.route,
  });
  final String subTitleString;
  final String? subTitle;

  final String? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(context));
  }

  Widget _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossCenter,
        children: [
          _congratulationImageWidget(context),
          Space.height.h20,
          // verticalSpace(Dimensions.heightSize * 2),
          _congratulationInfoWidget(context),
          // verticalSpace(Dimensions.heightSize * 1.33),

          // _buttonWidget(context),
        ],
      ),
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      padding: Space.vertical.v20,
      child: CustomButton(
        title: 'Back To Login',
        buttonTextColor: AppColors.white,
        onTap: () {
          route.pushNamed;
        },
      ),
    );
  }

  Widget _congratulationImageWidget(BuildContext context) {
    return Image.asset(Assets.icons.bell);
  }

  Widget _congratulationInfoWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: AppSize.horizontal),
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          CustomText(
            textAlign: TextAlign.center,
            maxLines: 2,
            subTitleString,
            size: 24,
            fontWeight: FontWeight.w600,
          ),
          Space.height.h10,
          CustomText(
            textAlign: TextAlign.center,
            maxLines: 2,
            subTitle ?? '',
            size: 16,
            color: AppColors.black.withValues(alpha: 0.3),
            fontWeight: FontWeight.w400,
          ),
          _buttonWidget(context),
        ],
      ),
    );
  }
}
