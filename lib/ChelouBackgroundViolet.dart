import 'package:cyberpizza/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChelouBackgroundViolet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: ChelouBackgroundPainter(),
      ),
    );
  }
}

class ChelouBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..color = deepBlueMedium
      ..style = PaintingStyle.fill;
    var verticalPadding = 20.0;
    var paddingHorizontal = 50.0;
    var path = Path();
    path..moveTo(0, size.height / 2 - 60);
    path..lineTo(paddingHorizontal, size.height / 2 - 60);
    path..lineTo(paddingHorizontal, 3 * size.height / 4);
    path
      ..cubicTo(
        paddingHorizontal,
        size.height - verticalPadding,
        size.width - paddingHorizontal,
        size.height - verticalPadding,
        size.width - paddingHorizontal,
        3 * size.height / 4,
      );

    path..lineTo(size.width - paddingHorizontal, size.height / 2 - 60);
    path..lineTo(size.width, size.height / 2 - 60);
    path..lineTo(size.width, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, size.height / 2 - 60);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
