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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: SvgPicture.asset(
                "assets/grid.svg",
                semanticsLabel: 'Acme Logo',
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
                  child: SvgPicture.asset(
                    "assets/cyberback.svg",
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}