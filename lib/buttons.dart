import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class CyberButton extends StatelessWidget {
  String text;
  double textSize;
  Color color;
  bool withArrow;

  CyberButton({
    this.text,
    this.color = secondary,
    this.textSize = 14,
    this.withArrow = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Widget arrow;
    if (withArrow) {
      arrow = Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: color,
        ),
      );
    } else {
      arrow = Container(width: 0, height: 0,);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.75),
          child: Container(
            child: CustomPaint(
                painter: NeonPainter(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(text,
                          style: TextStyle(
                            color: color,
                            fontSize: textSize,
                            shadows: [
                              Shadow(
                                offset: Offset.zero,
                                blurRadius: 4.0,
                                color: secondary,
                              ),
                              Shadow(
                                offset: Offset.zero,
                                blurRadius: 8.0,
                                color: color,
                              ),
                            ],
                          )),
                      arrow
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.75),
          child: Container(
            child: SvgPicture.asset(
              "assets/underlinebutton.svg",
              semanticsLabel: 'Acme Logo',
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: secondary.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset.zero,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CyberActionButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;

  CyberActionButton({
    this.text,
    this.color = materialPrimary,
    this.textColor = white,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1.5),
          child: Container(
            child: CustomPaint(
                painter: CyberAction(),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            offset: Offset.zero,
                            blurRadius: 4.0,
                            color: secondary,
                          ),
                          Shadow(
                            offset: Offset.zero,
                            blurRadius: 8.0,
                            color: color,
                          ),
                        ],
                      )),
                )),
          ),
        ),
      ],
    );
  }
}

class NeonPainter extends CustomPainter {
  NeonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var notchSize = size.height / 4;
    final shadowPaint = Paint()
      ..strokeWidth = 3
      ..color = secondary
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
    final borderPaint = Paint()
      ..strokeWidth = 1.5
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(size.width, 0);
    path..lineTo(size.width, size.height - notchSize);
    path..lineTo(size.width - notchSize, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
class CyberAction extends CustomPainter {
  CyberAction();

  @override
  void paint(Canvas canvas, Size size) {
    var gradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: <Color>[deepBlueDark, Colors.white.withOpacity(0.8)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 0.0, 20.0));
    final whitePaint = Paint()
      ..strokeWidth = 2
      ..color = secondary
      ..style = PaintingStyle.stroke
      ..shader = gradient;
    final shadowPaint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
    final borderPaint = Paint()
      ..color = materialPrimary
      ..style = PaintingStyle.fill;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(size.width, 0);
    path..lineTo(size.width, size.height - 20);
    path..lineTo(size.width - 20, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    canvas.drawPath(path, whitePaint);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
