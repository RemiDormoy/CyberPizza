import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class CyberButton extends StatelessWidget {
  String text;
  Color color;

  CyberButton({this.text, this.color = secondary}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.75),
          child: Material(
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
                  style:
                      TextStyle(color: secondary, fontWeight: FontWeight.bold),
                ),
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

class CyberActionButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;

  CyberActionButton({
    this.text,
    this.color = materialPrimary,
    this.textColor = white,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      color: color,
      type: MaterialType.canvas,
      shape: BeveledRectangleBorder(
          borderRadius:
              new BorderRadius.only(bottomRight: Radius.circular(15))),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
