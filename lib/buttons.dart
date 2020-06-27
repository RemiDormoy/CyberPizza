import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class CyberButton extends StatelessWidget {
  String text;

  CyberButton({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 0.0,
          color: Colors.transparent,
          type: MaterialType.button,
          shape: BeveledRectangleBorder(
              side: BorderSide(color: secondary, width: 1.5),
              borderRadius:
                  new BorderRadius.only(bottomRight: Radius.circular(15))),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                style: TextStyle(color: secondary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          "assets/underlinebutton.svg",
          semanticsLabel: 'Acme Logo',
        ),
      ],
    );
  }
}
