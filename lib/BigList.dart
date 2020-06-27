import 'dart:math';

import 'package:flutter/material.dart';

class BigList extends StatefulWidget {
  @override
  _BigListState createState() => _BigListState();
}

class _BigListState extends State<BigList> {
  var SCALE_FRACTION = 0.7;

  var FULL_SCALE = 1.0;

  PageController pageController;
  double page = 1;
  int currentPage = 1;

  @override
  void initState() {
    pageController = PageController(initialPage: 1, viewportFraction: 0.6);
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
        max(SCALE_FRACTION, (FULL_SCALE - (position - page).abs()) + 0.6);
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
      asset = "assets/armleft.png";
    } else if (position == 5) {
      asset = "assets/pistolet.png";
    } else if (position == 6) {
      asset = "assets/eyered.png";
    }
    return Transform.scale(
      scale: scale,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(asset),
        ),
      ),
    );
  }
}
