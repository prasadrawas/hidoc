import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/res/app_colors.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final top = Paint()
      ..color = kIsWeb ? Colors.white : buttonOrangeColor.withOpacity(0.35)
      ..style = PaintingStyle.fill;

    final bottom = Paint()
      ..color = kIsWeb ? Colors.white : secondary
      ..style = PaintingStyle.fill;

    // Draw curved shape in top-left corner
    final topLeftPath = Path()
      ..moveTo(1, size.height * 0.25)
      ..quadraticBezierTo(
          size.width * 0.4, size.width * 0.5, size.width * 0.4, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(topLeftPath, top);

    // Draw curved shape in bottom-right corner
    final bottomRightPath = Path()
      ..moveTo(size.width, size.height * 0.6)
      ..quadraticBezierTo(
          size.width * 0.1, size.height * 0.9, size.width * 0.6, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(bottomRightPath, bottom);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
