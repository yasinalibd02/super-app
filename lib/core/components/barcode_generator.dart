import '../base/app_core.dart';

class BarcodeGenerator extends StatelessWidget {
  final String barcodeString;

  const BarcodeGenerator({Key? key, required this.barcodeString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        AppSize.width,
        AppSize.vertical * 1.6,
      ),
      painter: BarcodePainter(barcodeString),
    );
  }
}

class BarcodePainter extends CustomPainter {
  final String barcodeString;

  BarcodePainter(this.barcodeString);

  // Sample representation of Code 128 patterns (simplified for demonstration)
  final Map<String, String> code128Patterns = {
    ' ': '11011001100',
    'A': '11001101100',
    'B': '11001100110',
    'C': '10010011000',
    '1': '11010011100',
    '2': '11000111010',
    '3': '10001011100',
    // Add more patterns as needed
  };

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    double x = 0; // Start drawing 10 units from the left

    // Start character for Code 128B (for demonstration purposes)
    String startPattern = '11010010000'; // Start B
    String stopPattern = '1100011101011'; // Stop pattern

    // Convert barcode string to a sequence of patterns
    String barcodePattern = startPattern;

    for (int i = 0; i < barcodeString.length; i++) {
      String char = barcodeString[i].toUpperCase();
      barcodePattern +=
          code128Patterns[char] ?? '11011001100'; // Fallback to a pattern
    }

    barcodePattern += stopPattern;

    // Draw the barcode lines
    double barWidth = size.width / barcodePattern.length;

    for (int i = 0; i < barcodePattern.length; i++) {
      if (barcodePattern[i] == '1') {
        canvas.drawRect(
          Rect.fromLTWH(x, 0, barWidth, size.height),
          paint,
        );
      }
      x += barWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
