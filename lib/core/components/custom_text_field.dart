
import '../../app/import.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Color? hintColor;
  final Color? floatingLabelColor;
  final Color? underlineDefaultColor;
  final Color? underlineFocusedColor;
  final Color? underlineErrorColor;
  final Color? underlineFocusedErrorColor;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.hintColor,
    this.floatingLabelColor,
    this.underlineDefaultColor,
    this.underlineFocusedColor,
    this.underlineErrorColor,
    this.underlineFocusedErrorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? "Enter your email or username",
        hintStyle: TextStyle(
          color: hintColor ?? Colors.grey.withValues(alpha: 0.3),
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText ?? "Username",
        floatingLabelStyle: TextStyle(
          color: floatingLabelColor ?? Colors.blue,
        ),
        labelStyle: TextStyle(
            color: AppColors.textColor.withValues(alpha: 0.3),
            fontWeight: FontWeight.w400,
            fontSize: AppSize.fontSize.bl * 1.3),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: underlineDefaultColor ?? Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: underlineFocusedColor ?? Colors.blue,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: underlineErrorColor ?? Colors.red,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: underlineFocusedErrorColor ?? Colors.orange,
          ),
        ),
      ),
    );
  }
}
