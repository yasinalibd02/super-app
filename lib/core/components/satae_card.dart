import '../base/app_core.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;
  final Color labelColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color backgroundColor;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.valueColor = Colors.blue,
    this.labelColor = Colors.black38,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    this.borderRadius = 10.0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
          Space.height.h5,
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: labelColor,
            ),
          ),
        ],
      ),
    );
  }
}
