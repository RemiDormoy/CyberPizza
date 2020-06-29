import 'package:cyberpizza/OkCyborgDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class OkCyborgPage extends StatelessWidget {
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
              child: Image.asset(
                "assets/grid.png",
//                semanticsLabel: 'Acme Logo',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 60, 60),
                  child: Image.asset(
                    "assets/cyberback.png",
//                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/okcyborg.gif"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: OkCyborgDialog(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
