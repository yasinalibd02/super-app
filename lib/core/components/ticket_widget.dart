import '../base/app_core.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Draw the main rectangular path
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    // Add the left and right circular notches
    path.addOval(Rect.fromCircle(
      center: Offset(0.0, size.height / 1.33),
      radius: AppSize.radius * 1.2,
    ));
    path.addOval(Rect.fromCircle(
      center: Offset(size.width, size.height / 1.33),
      radius: AppSize.radius * 1.2,
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Dashed line paint
    double dashWidth = 8;
    double dashSpace = 5;
    double startX = -5; // Starting after the left notch
    final double endX = size.width; // Ending before the right notch
    final double centerY = size.height / 1.27; // Same y-coordinate as the ovals

    while (startX < endX) {
      canvas.drawLine(
          Offset(startX, centerY), Offset(startX + dashWidth, centerY), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.dashColor,
    this.isCornerRounded = false,
    this.shadow,
  });

  final double width;
  final double height;
  final Widget child;
  final Color color;
  final Color? dashColor;
  final bool isCornerRounded;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        // width: widget.width,
        // height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          boxShadow: widget.shadow,
          color: widget.color,
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(
                  AppSize.radius * 1.2,
                ) // Adjust radius if needed
              : BorderRadius.circular(0.0),
        ),
        child: CustomPaint(
          painter: DashedLinePainter(
            color: widget.dashColor ?? AppColors.primaryColor,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
