import 'dart:math';

import 'package:flutter/material.dart';

class BigList extends StatefulWidget {

  Function(int) onPageChanged;
  int initialChild;
  _BigListState _state = _BigListState();

  @override
  _BigListState createState() {
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
    pageController = PageController(initialPage: widget.initialChild, viewportFraction: viewPortFraction);
    pageController..addListener(_listener);
    super.initState();
  }

  _listener() {}

  @override
  Widget build(BuildContext context) {
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
    final scale =
        min(1.0, max(SCALE_FRACTION, (FULL_SCALE - (position - page).abs()) + viewPortFraction));
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
    print("scale : " + scale.toString());
    return Transform.scale(
      scale: scale,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Image.asset(
            asset,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  setPage(int page) {
    pageController.jumpToPage(page);
  }
}
