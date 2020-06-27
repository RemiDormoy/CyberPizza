import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class CyberButton extends StatelessWidget {
  String text;
  Color color;

  CyberButton({this.text, this.color = secondary}) : super();

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
                painter: NeonPainter(),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(text,
                      style: TextStyle(
                        color: color,
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
        Padding(
          padding: const EdgeInsets.only(top: 1.5),
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
    return Material(
      elevation: 0.0,
      color: color,
      type: MaterialType.canvas,
      shape: BeveledRectangleBorder(
          borderRadius:
              new BorderRadius.only(bottomRight: Radius.circular(15))),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class NeonPainter extends CustomPainter {
  NeonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..strokeWidth = 4
      ..color = secondary
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
    final borderPaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(size.width, 0);
    path..lineTo(size.width, size.height - 20);
    path..lineTo(size.width - 20, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
