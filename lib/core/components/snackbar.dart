import '../base/app_core.dart';

class CustomSnack {
  static showCustomSnackBar(BuildContext context) {
    const snackBar = CustomSnackBar(
      message: 'This is a custom SnackBar!',
      iconData: Icons.warning,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      duration: Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showMaterialBanner(const MaterialBanner(
      content: snackBar,
      actions: [Text('data')],
    ));
  }
}

class CustomSnackBar extends StatelessWidget {
  final String message;
  final IconData iconData;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;

  const CustomSnackBar({
    super.key,
    required this.message,
    this.iconData = Icons.info,
    this.backgroundColor = Colors.black87,
    this.textColor = Colors.white,
    this.duration = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: textColor,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
