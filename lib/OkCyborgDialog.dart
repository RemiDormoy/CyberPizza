import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'colors.dart';

class OkCyborgDialog extends StatefulWidget {
  @override
  _OkCyborgDialogState createState() => _OkCyborgDialogState();
}

class _OkCyborgDialogState extends State<OkCyborgDialog> {
  var dialog = ["VOCAL IDENTIFICATION INITIATING..."];

  var wasPlayed1 = false;
  var wasPlayed2 = false;
  var wasPlayed3 = false;
  var wasPlayed4 = false;

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1, milliseconds: 500),
            () =>
        {
          if (!wasPlayed1)
            {
              wasPlayed1 = true,
              setState(() {
                dialog.add("TELL ME YOUR DELIVERY ADDRESS");
              })
            }
        });
    Timer(
        Duration(seconds: 3, milliseconds: 500),
            () =>
        {
          if (!wasPlayed2)
            {
              wasPlayed2 = true,
              setState(() {
                dialog.add("14 AV CORBERA SET AS DELIVERY ADDRESS");
              })
            }
        });
    Timer(
        Duration(seconds: 5),
            () =>
        {
          if (!wasPlayed3)
            {
              wasPlayed3 = true,
              setState(() {
                dialog.add("IDENTIFICATION SUCEEDED");
              })
            }
        });
    Timer(
        Duration(seconds: 10, milliseconds: 500),
            () =>
        {
          if (!wasPlayed4)
            {
              wasPlayed4 = true,
              Navigator.of(context).pushNamed("/products", arguments: {"buyCompleted" : true})

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
