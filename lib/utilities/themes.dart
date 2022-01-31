import 'package:flutter/material.dart';

import './colors.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: backgroundColor,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: backgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
        ),
      ),
      textTheme: TextTheme(
        headline4: TextStyle(color: textColor),
        headline6: TextStyle(color: textColor),
        bodyText1: TextStyle(
            color: textColor,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.w500),
        bodyText2: TextStyle(
            color: textColor,
            fontFamily: "Quicksand",
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: black,
    );
  }
}
