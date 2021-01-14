import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/loadingPage.dart';
import 'package:flutter_workshop/pages/loginPage.dart';
import 'package:flutter_workshop/pages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: brightness,
        primaryColor: Color(0xFFa4161a),
        accentColor: Color(0xFFe5383b),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Bungee',
            color: brightness == Brightness.light
                ? Color(0xFF161a1d)
                : Color(0xFFFFFFFF),
            fontSize: 32,
          ),
          headline1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: brightness == Brightness.light
                ? Color(0xFF161a1d)
                : Color(0xFFFFFFFF),
          ),
          headline2: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: brightness == Brightness.light
                ? Color(0xFF161a1d)
                : Color(0xFFFFFFFF),
          ),
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: brightness == Brightness.light
                ? Color(0xFF161a1d)
                : Color(0xFFFFFFFF),
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSant',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: brightness == Brightness.light
                ? Color(0xFF161a1d)
                : Color(0xFFFFFFFF),
          ),
        ),
      ),
      routes: {
        '/': (context) => LoadingPage(),
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
