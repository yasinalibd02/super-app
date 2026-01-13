import '../base/app_core.dart';

class CustomStyledSwitch extends StatelessWidget {
  final bool isToggled;
  final Function(bool) onToggle;

  const CustomStyledSwitch({
    Key? key,
    required this.isToggled,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isToggled,
      onChanged: onToggle,
      activeColor: Colors.green,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.shade300,
    );
  }
}
