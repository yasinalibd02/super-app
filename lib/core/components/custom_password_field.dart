
import '../../app/import.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;

  const CustomPasswordField({
    Key? key,
    this.controller,
    this.hintText = "Enter your password",
    this.labelText = "Password",
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withValues(alpha: 0.3),
          fontWeight: FontWeight.w400,
        ),
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(
          color: AppColors.contentColorCyan,
        ),
        labelStyle: TextStyle(
            color: AppColors.textColor.withValues(alpha: 0.3),
            fontWeight: FontWeight.w400,
            fontSize: AppSize.fontSize.bl * 1.3),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
}
