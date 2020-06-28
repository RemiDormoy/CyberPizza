import 'package:cyberpizza/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChelouBackgroundViolet.dart';
import 'ProductDetail.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
//        card(context),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/4,
          child: CustomPaint(
              painter: DialogNeoPainter(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '/Success;',
                            style: TextStyle(
                              color: primary,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(-2, 0),
                                  blurRadius: 2,
                                  color: secondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cybernetic neck - \$234,99',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '//////////////////////////////////////',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Your order will be materialize soon.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Thank you for shopping with us.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        //...top circlular image part,
      ],
    );
  }
}

class DialogNeoPainter extends CustomPainter {
  DialogNeoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    double offset = 3;
    var notchSize = size.height / 8;
    final backgroundPaint = Paint()
      ..color = white
      ..style = PaintingStyle.fill;
    final borderPrimaryPaint = Paint()
      ..strokeWidth = 2
      ..color = primary
      ..style = PaintingStyle.stroke;
    final borderSecondaryPaint = Paint()
      ..strokeWidth = 2
      ..color = secondary
      ..style = PaintingStyle.stroke;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(size.width, 0);
    path..lineTo(size.width, size.height - notchSize);
    path..lineTo(size.width - notchSize, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    var pathWithOffset = Path();
    pathWithOffset..moveTo(offset, offset);
    pathWithOffset..lineTo(size.width + offset, offset);
    pathWithOffset
      ..lineTo(size.width + offset, size.height - notchSize + offset);
    pathWithOffset
      ..lineTo(size.width - notchSize + offset, size.height + offset);
    pathWithOffset..lineTo(offset, size.height + offset);
    pathWithOffset..lineTo(offset, offset);
    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(pathWithOffset, borderPrimaryPaint);
    canvas.drawPath(path, borderSecondaryPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
