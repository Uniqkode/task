import 'package:flutter/material.dart';

class BlendPainter extends CustomPainter {
  final double blendHeightFraction; // Fraction of screen height for blend

  BlendPainter({this.blendHeightFraction = 0.5}); // Default to 50% blend

  @override
  void paint(Canvas canvas, Size size) {
    final blendHeight = size.height * blendHeightFraction;
    final rect =
        Rect.fromLTWH(0, size.height - blendHeight, size.width, blendHeight);

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.transparent,
          Colors.black, // Increased opacity for darker bottom
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect); // Shader applied only to the blend area

    canvas.drawRect(rect, paint); // Draw only the blend rectangle
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
