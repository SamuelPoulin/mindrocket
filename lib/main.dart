import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/loadingPage.dart';
import 'package:flutter_workshop/pages/loginPage.dart';
import 'package:flutter_workshop/pages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFa4161a),
        accentColor: Color(0xFFe5383b),
        textTheme: TextTheme(
          headline6: TextStyle(
              fontFamily: 'Bungee', color: Color(0xFF161a1d), fontSize: 32),
          headline1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: Color(0xFF161a1d),
          ),
          headline2: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Color(0xFF161a1d),
          ),
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF161a1d),
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSant',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF161a1d),
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
