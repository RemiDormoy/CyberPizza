import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BigList.dart';
import 'ChelouBackgroundViolet.dart';
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

  @override
  Widget build(BuildContext context) {
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
          ChelouBackgroundViolet(),
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
                    text: "Bionic arms",
                    withArrow: true,
                  ),
                ),
              ),
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
                  child: SizedBox(
                      height: 100, width: 300.0, child: _bottomList())), //
            ],
          ),
        ],
      ),
    ));
  }

  var images = ['assets/eyeblue.png',
      'assets/neck.png',
      'assets/helmet.png',
      'assets/armleft.png',
      'assets/pistolet.png',
      'assets/armright.png',
      'assets/eyered.png'];

  var titles = ['/Blue zooming eye;',
    '/Cybernetic neck;',
    '/Daft punk helmet;',
    '/Left power arm;',
    '/Energy boost (200ml);',
    '/Right extensible arm;',
    '/Red laser eye;'];

  var prices = ['€31,89',
    '<New - €234,99',
    '€3231,89',
    '€610,56',
    '€11,00',
    '€543,90',
    '€31,89'];

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
