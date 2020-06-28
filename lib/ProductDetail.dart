import 'dart:math';

import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    zoomingController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this)
          ..addListener(() => setState(() {}));
    floatingController =
        AnimationController(duration: Duration(seconds: 100), vsync: this)
          ..addListener(() => setState(() {}));
    floatingAnimation =
        Tween(begin: 0.0, end: 62.8).animate(floatingController);
    zoomingAnimation = Tween(begin: 0.0, end: 1.0).animate(zoomingController);
    floatingController.forward();
    floatingController
      ..addListener(() {
        if (floatingController.status == AnimationStatus.completed) {
          floatingController.reverse();
        } else if (floatingController.status == AnimationStatus.dismissed) {
          floatingController.forward();
        }
      });
  }

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
                  child: Image.asset(
                    'assets/applogo.png',
                    width: 200,
                    height: 50,
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
              height: MediaQuery.of(context).size.height - 100,
              child: buildMainDetailPart(context),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 60, 60),
                child: SvgPicture.asset(
                  "assets/cyberback.svg",
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  CustomPaint buildMainDetailPart(BuildContext context) {
    return CustomPaint(
        painter: DetailBackgroundPainter(),
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  "assets/bottombutton_pink.svg",
                  color: accent,
                  semanticsLabel: 'Acme Logo',
                  width: 90,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Text(
                    '/Cybernetic neck;',
                    style: TextStyle(
                      color: white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset.zero,
                          blurRadius: 16.0,
                          color: materialPrimary,
                        ),
                        Shadow(
                          offset: Offset.zero,
                          blurRadius: 16.0,
                          color: materialPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 1 - zoomingAnimation.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Text(
                      '<New - €234,99',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 1 - zoomingAnimation.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                    ),
                    child: Text(
                      '//////////////////////////////////////////////////////////////////////////////',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 1 - zoomingAnimation.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      'Protect your neck with up to date tech, developed by our best experts and enjoy lifting up to 500kg with your head !',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: buildZoomingImage(),
              )),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/okcyborg");
                  },
                  child: CyberActionButton(
                    text: "Buy with OK CYBORG",
                  ),
                ),
              )
            ],
          ),
        ));
  }

  AnimationController floatingController;
  Animation<double> floatingAnimation;
  AnimationController zoomingController;
  Animation<double> zoomingAnimation;

  Transform buildZoomingImage() {
    var scale = 1 + zoomingAnimation.value * 0.5;
    return Transform.scale(
      scale: scale,
      child: Transform.translate(
        offset: Offset(-zoomingAnimation.value * MediaQuery.of(context).size.width / 4, 0.0),
        child: buildFlottingImage(),
      ),
    );
  }

  Transform buildFlottingImage() {
    return Transform.translate(
      offset: Offset(
          5 * cos(floatingAnimation.value), 15 * sin(floatingAnimation.value)),
      child: Stack(
        children: [
          Center(child: Image.asset("assets/neck.png")),
          Positioned(
            left: MediaQuery.of(context).size.width * 12 / 100,
            top: MediaQuery.of(context).size.height * 11 / 100,
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              "assets/yellowpointer.svg",
              semanticsLabel: 'Acme Logo',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 26 / 100,
            top: MediaQuery.of(context).size.height * 27 / 100,
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              "assets/yellowpointer.svg",
              semanticsLabel: 'Acme Logo',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 52 / 100,
            top: MediaQuery.of(context).size.height * 13 / 100,
            width: 25,
            height: 25,
            child: GestureDetector(
              onTap: () {
                print("le controller commence !");
                zoomingController.forward();
              },
              child: SvgPicture.asset(
                "assets/yellowpointer.svg",
                semanticsLabel: 'Acme Logo',
                fit: BoxFit.contain,
              ),
            ),
          ),
          buildExplanations(),
        ],
      ),
    );
  }

  Widget buildExplanations() {
    return Opacity(
      opacity: zoomingAnimation.value,
      child: Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width / 4, 0),
              child: Container(
                width: (MediaQuery.of(context).size.width / 2 - 20),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ENHANCED KEVLAR PIECE", style: TextStyle(fontSize: 10),),
                      Text("A22-C5637", style: TextStyle(fontSize: 8),),
                      Text(
                        '/ / / / / / / / / / / / / / / / / / / / / ',
                        style: TextStyle(
                            fontSize: 5,
                            fontFamily: GoogleFonts.roboto().fontFamily),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 4.0),
                        child: Text("Yolo mzboab goiubouerb guboiuberg gbgzeuboegbg giubergb ugbbiu iubuibg oeu ueiubb", style: TextStyle(fontSize: 8),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            zoomingController.reverse();
                          },
                          child: CyberActionButton(
                            color: white,
                            textColor: deepBlueDark,
                            textSize: 8,
                            text: "See less",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  var pointerSelected = false;

  @override
  void dispose() {
    floatingController.dispose();
    zoomingController.dispose();
    super.dispose();
  }
}

class DetailBackgroundPainter extends CustomPainter {
  DetailBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var notchSize = size.height / 28;
    var notch2SizeWidth = 80.0;
    var notch2SizeHeigth = 9.0;
    final borderPaint = Paint()
      ..strokeWidth = 1.5
      ..color = deepBlueMedium
      ..style = PaintingStyle.fill;
    var path = Path();
    path..moveTo(0, 0);
    path..lineTo(notch2SizeWidth, 0);
    path..lineTo(notch2SizeWidth + notch2SizeHeigth, notch2SizeHeigth);
    path..lineTo(size.width - notchSize, notch2SizeHeigth);
    path..lineTo(size.width, notchSize + notch2SizeHeigth);
    path..lineTo(size.width, size.height);
    path..lineTo(0, size.height);
    path..lineTo(0, 0);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
