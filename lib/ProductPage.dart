import 'package:flutter/material.dart';

import 'buttons.dart';
import 'colors.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: deepBlueDark),
      child: Row(
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Column(
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
              Expanded(
                child: Center(
                  child: CyberActionButton(text: "Je suis un boulet",),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    ));
  }
}
