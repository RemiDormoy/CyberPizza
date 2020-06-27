import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BigList.dart';
import 'ChelouBackgroundViolet.dart';
import 'colors.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: BigList(),
              ),
              Text(
                '/Cybernetic neck;',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '<New - €234,99',
                  style: TextStyle(
                      fontSize: 16,
                      color: white.withOpacity(0.8)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CyberButton(
                  text: "See product",
                  color: materialPrimary,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                      height: 142, width: 300.0,
                      child: _bottomList())), //

            ],
          ),
        ],
      ),
    ));
  }

  _bottomList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _itemView('assets/eyeblue.png'),
        _itemView('assets/neck.png'),
        _itemView('assets/helmet.png'),
        _itemView('assets/armleft.png'),
        _itemView('assets/armright.png'),
        _itemView('assets/pistolet.png'),
        _itemView('assets/eyered.png'),
      ],
    );
  }

  _itemView(String url) {
    return Container(
      height: 40,
      width: 70,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Image.asset(
          url,
          height: 40.0,
          width: 70,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
