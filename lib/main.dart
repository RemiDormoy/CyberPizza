import 'dart:async';
import 'dart:ui';

import 'package:cyberpizza/ProductPage.dart';
import 'package:cyberpizza/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ProductDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5, milliseconds: 242),
        () => {
              if (!wasPlayed)
                {wasPlayed = true, Navigator.of(context).pushNamed("/products")}
            });

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
