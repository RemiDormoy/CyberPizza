import 'package:cyberpizza/buttons.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: deepBlueDark),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Hero(
                tag: "titleAnimation",
                child: Text(
                  'CyberPizza',
                  style: TextStyle(fontSize: 24),
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
                      blurRadius: 8.0,
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
            child: Container(),
          )
        ],
      ),
    ));
  }
}
