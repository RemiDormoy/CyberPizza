import 'package:flutter/material.dart';

import 'colors.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: deepBlueDark),
          child: Align(
            alignment: Alignment.topCenter,
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
        )
      );
  }

}