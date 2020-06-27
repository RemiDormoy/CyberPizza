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
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                      height: 142, width: 300.0, child: _bottomList())), //
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
        _itemView('assets/Neck.png'),
        _itemView('assets/Helmet.png'),
        _itemView('assets/Armleft.png'),
        _itemView('assets/Armright.png'),
        _itemView('assets/Pistolet.png'),
      ],
    );
  }

  _itemView(String url) {
    return Container(
      height: 42.0,
      width: 56.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Image.asset(
          url,
          height: 42.0,
          width: 56.0,
        ),
      ),
    );
  }
}
