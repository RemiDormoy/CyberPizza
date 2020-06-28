import 'dart:async';

import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BigList.dart';
import 'ChelouBackgroundViolet.dart';
import 'CustomDialog.dart';
import 'colors.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Product();
  }
}

class Product extends State<ProductPage> {
  var productFocused = 1;
  BigList bigList;
  var _isAnimated = false;
  var _isAddedBeforeAnim = false;
  var _hasShownDialog = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
//    _isAddedBeforeAnim = true;
//    _isAnimated = true;

    if (_hasShownDialog == false && rcvdData != null && rcvdData.containsKey("buyCompleted")) {
      print("pop up is shwon");
      _isAnimated = true;
      _isAddedBeforeAnim = true;
      _hasShownDialog = true;

//
      Timer(
          Duration(seconds: 0, milliseconds: 0),
              () => {
                    ssshowDialog(context),
          });

//      print("rcvd fdata ${rcvdData['buyCompleted']}");
//      ssshowDialog(context);
    } else if (rcvdData == null && (_isAnimated == false || _isAddedBeforeAnim == false)) {
      print("pop up is shwon");
      var duration = 380;
      if (_isAddedBeforeAnim == false) {
        duration = 380;
      } else {
        duration = 94;
      }
      Timer(
          Duration(seconds: 0, milliseconds: duration),
          () => {
                setState(() {
                  print("seting state ???");
                  if (_isAddedBeforeAnim == false) {
                    _isAddedBeforeAnim = true;
                  } else {
                    _isAnimated = true;
                  }
                })
              });
    }

    bigList = BigList(
      onPageChanged: _onProductFocusChanged,
      initialChild: productFocused,
    );
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: deepBlueDark),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              "assets/grid.svg",
              semanticsLabel: 'Acme Logo',
              fit: BoxFit.fill,
            ),
          ),
          animationAlphaChelou(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 50, 40, 20),
                  child: Hero(
                    tag: "titleAnimation",
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Welcome back',
                    style: TextStyle(
                      color: white,
                      fontSize: 32,
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: CyberButton(
                    text: "Trending",
                    withArrow: true,
                  ),
                ),
              ),
              // here
              animationAlphaContent()
            ],
          ),
        ],
      ),
    ));
  }

  animationAlphaChelou() {
    if (_isAddedBeforeAnim) {
    } else {
      return Container();
    }

//    return item;

//    if (_isAnimated) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: _isAnimated ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        // The green box must be a child of the AnimatedOpacity widge

        child: ChelouBackgroundViolet()),
    );
//    }
  }

 Widget animationAlphaContent() {
    if (_isAddedBeforeAnim) {
    } else {
      return Container();
    }

    return Expanded(
      child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _isAnimated ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widge

          child: contentAnimated()),
    );
//    }
  }

  contentAnimated() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: bigList,
          ),
          Text(
            titles[productFocused],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              prices[productFocused],
              style: TextStyle(fontSize: 16, color: white.withOpacity(0.8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 60),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/detail");
              },
              child: CyberButton(
                text: "See product",
                color: materialPrimary,
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [gradientTop, gradientBottom],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child:
                  SizedBox(height: 100, width: 300.0, child: _bottomList())), //
        ],
      ),
    ); //here end
  }

  ssshowDialog(BuildContext context) {
    print("pop up showing now");
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "Success",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonText: "Okay",
      ),
    );
  }

  var images = [
    'assets/eyeblue.png',
    'assets/neck.png',
    'assets/helmet.png',
    'assets/armleft.png',
    'assets/pistolet.png',
    'assets/armright.png',
    'assets/eyered.png'
  ];

  var titles = [
    '/Blue zooming eye;',
    '/Cybernetic neck;',
    '/Daft punk helmet;',
    '/Left power arm;',
    '/Energy boost (200ml);',
    '/Right extensible arm;',
    '/Red laser eye;'
  ];

  var prices = [
    '€31,89',
    '<New - €234,99',
    '€3231,89',
    '€610,56',
    '€11,00',
    '€543,90',
    '€31,89'
  ];

  _bottomList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: _itemView,
    );
  }

  Widget _itemView(BuildContext context, int position) {
    var isSelected = position == productFocused;

    var item = Container(
      height: 4.0,
      width: 56.0,
    );
    if (isSelected) {
      item = Container(
        height: 4.0,
        width: 56.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.75),
          child: Container(
            child: SvgPicture.asset(
              "assets/bottombutton_pink.svg",
              semanticsLabel: 'Acme Logo',
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset.zero,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        bigList.setPage(position);
      },
      child: Container(
        height: 40,
        width: 70,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                images[position],
                height: 40.0,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
            item
          ],
        ),
      ),
    );
  }

  _onProductFocusChanged(int postition) {
    print("je focus");
    setState(() {
      productFocused = postition;
    });
  }
}
