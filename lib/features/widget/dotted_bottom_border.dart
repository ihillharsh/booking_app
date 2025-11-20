import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';


class DottedBottomBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double gap;

  const DottedBottomBorder({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.strokeWidth = 1,
    this.gap = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(color: color, strokeWidth: strokeWidth, gap: gap),
      child: Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: child,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DottedLinePainter({required this.color, required this.strokeWidth, required this.gap});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startX = 0;
    final double y = size.height; // Draw at the very bottom

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, y),
        Offset(startX + gap, y), // Length of the dot/dash
        paint,
      );
      startX += gap * 2; // Move forward by dot length + gap length
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}