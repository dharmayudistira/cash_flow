import 'package:flutter/material.dart';

class ThemesApp {
  static final lightMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Decker',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: 'Decker',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontFamily: 'Decker',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Decker',
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Decker',
        fontSize: 14,
        color: Colors.black45,
      ),
    ),
  );

  static final darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Decker',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        // color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: 'Decker',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        // color: Colors.black,
      ),
      headline3: TextStyle(
        fontFamily: 'Decker',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        // color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Decker',
        fontSize: 16,
        // color: Colors.black87,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Decker',
        fontSize: 14,
        // color: Colors.black45,
      ),
    ),
  );
}
