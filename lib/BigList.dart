import 'dart:math';

import 'package:cyberpizza/colors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class BigList extends StatefulWidget {
  Function(int) onPageChanged;
  int initialChild;
  _BigListState _state;

  @override
  _BigListState createState() {
    _state = _BigListState();
    return _state;
  }

  setPage(int page) {
    _state.setPage(page);
  }

  BigList({this.onPageChanged, this.initialChild});
}

class _BigListState extends State<BigList> {
  var SCALE_FRACTION = 0.5;

  var FULL_SCALE = 1.0;
  var viewPortFraction = 0.4;

  PageController pageController;
  double page = 1;
  int currentPage = 1;

  @override
  void initState() {
    pageController = PageController(
        initialPage: widget.initialChild, viewportFraction: viewPortFraction);
    pageController..addListener(_listener);
    super.initState();
  }

  _listener() {}

  @override
  Widget build(BuildContext context) {
    widget._state = this;
    return NotificationListener<ScrollNotification>(
      onNotification: onNotif,
      child: PageView.builder(
        itemBuilder: _builder,
        itemCount: 7,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (pos) {
          setState(() {
            currentPage = pos;
            widget.onPageChanged(pos);
          });
        },
      ),
    );
  }

  bool onNotif(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      setState(() {
        page = pageController.page;
        print("je suis une notif: on notif");
      });
    }
  }

  Widget _builder(BuildContext context, int position) {
    final scale = min(
        1.0,
        max(SCALE_FRACTION,
            (FULL_SCALE - (position - page).abs()) + viewPortFraction));
    String asset;
    if (position == 0) {
      asset = "assets/eyeblue.png";
    } else if (position == 1) {
      asset = "assets/neck.png";
    } else if (position == 2) {
      asset = "assets/helmet.png";
    } else if (position == 3) {
      asset = "assets/armright.png";
    } else if (position == 4) {
      asset = "assets/pistolet.png";
    } else if (position == 5) {
      asset = "assets/armleft.png";
    } else if (position == 6) {
      asset = "assets/eyered.png";
    }
    Widget topSale;
    if (position % 5 == 10) {
      topSale = Transform.translate(
        offset: Offset(-40, 0),
        child: Container(
          child: CustomPaint(
            painter: TopSalePainter(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/flamme.png",
//                    semanticsLabel: 'Acme Logo',
                    fit: BoxFit.contain,
                    width: 15,
                    height: 15
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 2),
                    child: Text("TOP SALE", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      topSale = Container();
    }
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTap: () {
          if (position == pageController.page)
            Navigator.of(context).pushNamed("/detail");
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    asset,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: topSale,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  setPage(int page) {
    pageController.jumpToPage(page);
  }
}

class TopSalePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFD8D8D8).withOpacity(0.22)
      ..style = PaintingStyle.fill;
    var path = Path();
    path..moveTo(20, 0);
    path..lineTo(size.width, 0);
    path..lineTo(size.width - 15, size.height);
    path..lineTo(0, size.height);
    path..lineTo(15, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
