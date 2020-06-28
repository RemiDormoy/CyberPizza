import 'dart:async';
import 'dart:ui';

import 'package:cyberpizza/ProductPage.dart';
import 'package:cyberpizza/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OkCyborgPage.dart';
import 'ProductDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        primarySwatch: materialPrimary,
        textTheme: GoogleFonts.turretRoadTextTheme().apply(
          bodyColor: white,
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/products": (context) => ProductPage(),
        "/detail": (context) => ProductDetail(),
        "/okcyborg": (context) => OkCyborgPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wasPlayed = false;
  var delayTextAppear = false; // prevent multiple cast of the timer
  var delayTextAppearReady = false; // verify if we can display the text

  @override
  Widget build(BuildContext context) {
    if (delayTextAppear == false && wasPlayed == false) {
      delayTextAppear = true;
      Timer(
          Duration(seconds: 2, milliseconds: 222),
          () => {
                setState(() {
                  delayTextAppear = true;
                  delayTextAppearReady = true;
                })
              });
    } else if (!wasPlayed) {
      Timer(
          Duration(seconds: 4, milliseconds: 40),
          () => {
                if (!wasPlayed)
                  {
                    wasPlayed = true,
                    Navigator.of(context).pushReplacementNamed("/products")
                  }
              });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: deepBlueDark),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(
                "assets/backgroundsplash.svg",
                semanticsLabel: 'Acme Logo',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(
                "assets/background_splash.svg",
                semanticsLabel: 'Acme Logo',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                width: 200,
                child: Stack(
                  children: [
                    Container(
                      child: Hero(
                        tag: "titleAnimation",
                        child: Image.asset(
                          "assets/applogo.png",
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/Logo.gif",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: delayTextAppearReady ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widge

                child: Container(
                  margin: const EdgeInsets.only(bottom: 80.0),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Best bionic parts in town",
                      style: TextStyle(
                          fontSize: 16, color: white.withOpacity(0.8)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}
