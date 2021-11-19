import 'package:flutter/material.dart';

class VolgaTheme {
  static ThemeData get theme => ThemeData(
        primaryColorDark: Colors.black,
        bottomAppBarColor: const Color(0xFFE21A1A),
        splashColor: Colors.grey,
        primaryColorLight: Colors.white,
        shadowColor: Colors.black54,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 28,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            fontSize: 24,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            fontSize: 12,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
