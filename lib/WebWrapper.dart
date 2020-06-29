import 'package:cyberpizza/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebWrapper extends StatelessWidget {

  Widget child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      if (height / width < 1.9) {
        return Container(
          decoration: BoxDecoration(
            color: deepBlueLight,
          ),
          width: width,
          height: height,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: height - 40,
                width: (height - 40) / 2,
                child: child,
              ),
            ),
          ),
        );
      } else {
        return child;
      }
    } else {
      return child;
    }
  }

  WebWrapper({this.child});
}

class WebWrapperDialog extends StatelessWidget {

  Widget child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      if (height / width < 1.9) {
        return Center(
            child: Container(
              width: (height - 40) / 2,
              child: child,
            ),
          );
      } else {
        return child;
      }
    } else {
      return child;
    }
  }

  WebWrapperDialog({this.child});
}