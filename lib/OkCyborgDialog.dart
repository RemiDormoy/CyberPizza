import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'colors.dart';

class OkCyborgDialog extends StatefulWidget {
  @override
  _OkCyborgDialogState createState() => _OkCyborgDialogState();
}

class _OkCyborgDialogState extends State<OkCyborgDialog> {
  var dialog = [""];

  var wasPlayed0 = false;
  var wasPlayed1 = false;
  var wasPlayed2 = false;
  var wasPlayed3 = false;
  var wasPlayed4 = false;

  buildFirstText() {
    setState(() {
      dialog.add("");
    });
    var sentence = "TELL ME YOUR DELIVERY ADDRESS";
    for (var i = 0; i <= sentence.length; i++) {
      Timer(
        Duration(milliseconds: 50 * i),
        () => {
          setState(() {
            dialog[1] = sentence.substring(0, i);
          })
        },
      );
    }
  }

  buildText2() {
    setState(() {
      dialog.add("");
    });
    var sentence = "14 AV CORBERA SET AS DELIVERY ADDRESS";
    for (var i = 0; i <= sentence.length; i++) {
      Timer(
        Duration(milliseconds: 50 * i),
        () => {
          setState(() {
            dialog[2] = sentence.substring(0, i);
          })
        },
      );
    }
  }

  buildText3() {
    setState(() {
      dialog.add("");
    });
    var sentence = "IDENTIFICATION SUCEEDED";
    for (var i = 0; i <= sentence.length; i++) {
      Timer(
        Duration(milliseconds: 50 * i),
        () => {
          setState(() {
            dialog[3] = sentence.substring(0, i);
          })
        },
      );
    }
  }

  buildText0() {
    var sentence = "VOCAL IDENTIFICATION INITIATING...";
    for (var i = 0; i <= sentence.length; i++) {
      Timer(
        Duration(milliseconds: 50 * i),
        () => {
          setState(() {
            dialog[0] = sentence.substring(0, i);
          })
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!wasPlayed0) {
      //wasPlayed0 = true; Leave this bug because it creates a beautiful effect
      buildText0();
    }
    Timer(
        Duration(seconds: 2),
        () => {
              if (!wasPlayed1) {wasPlayed1 = true, buildFirstText()}
            });
    Timer(
        Duration(seconds: 4, milliseconds: 500),
        () => {
              if (!wasPlayed2) {wasPlayed2 = true, buildText2()}
            });
    Timer(
        Duration(seconds: 7),
        () => {
              if (!wasPlayed3) {wasPlayed3 = true, buildText3()}
            });
    Timer(
        Duration(seconds: 9),
        () => {
              if (!wasPlayed4)
                {
                  wasPlayed4 = true,
                  Navigator.of(context)
                      .pushNamed("/products", arguments: {"buyCompleted": true})

//              Navigator.of(context).pushNamedAndRemoveUntil(
//                  "/products", (route) => route.settings.name, )
//              //hNamed(, arguments: {"buyCompleted" : true})
                }
            });
    return ListView.builder(
      itemCount: dialog.length,
      itemBuilder: _buildItem,
      shrinkWrap: true,
    );
  }

  Widget _buildItem(BuildContext context, int position) {
    var opacity = max(0.1, 1 - 0.4 * (dialog.length - position - 1));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Opacity(
        opacity: opacity,
        child: Text(
          dialog[position],
          style: TextStyle(fontSize: 16, color: white),
        ),
      ),
    );
  }
}
