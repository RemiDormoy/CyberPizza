import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ChelouBackgroundViolet.dart';
import 'colors.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: deepBlueDark),
      child: Stack(
        children: [
          Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'CyberPizza',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              "assets/grid.svg",
              semanticsLabel: 'Acme Logo',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-100,
              child: CustomPaint(
                  painter: NeonPainter(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    ),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}

class NeonPainter extends CustomPainter {
  NeonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var notchSize = size.height / 28;
    final borderPaint = Paint()
      ..strokeWidth = 1.5
      ..color = deepBlueMedium
      ..style = PaintingStyle.fill;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(size.width - notchSize, 0);
    path..lineTo(size.width, notchSize);
    path..lineTo(size.width, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
