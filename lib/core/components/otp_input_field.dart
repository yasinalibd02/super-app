import 'package:pin_code_fields/pin_code_fields.dart';

import '../base/app_core.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      cursorHeight: 20,
      cursorColor: AppColors.textColor,
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(color: AppColors.textColor, fontSize: 16),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(
          AppSize.radius * 1.2,
        ),
        selectedColor: AppColors.primaryColor,
        activeColor: AppColors.black.withValues(alpha: 0.1),
        inactiveColor: AppColors.black.withValues(alpha: 0.1),
        // fieldHeight: AppSize.vertical * 2,
        fieldWidth: AppSize.horizontal * 2,
        activeFillColor: AppColors.white,
        selectedFillColor: AppColors.white,
        inactiveFillColor: AppColors.white,
        borderWidth: 0.5,
        activeBorderWidth: 0.5,
      ),
      onChanged: (String value) {},
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
