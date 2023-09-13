import 'package:flutter/material.dart';

class AppThemes {
  static var lightTheme = ThemeData(
      primaryColor: const Color(0xFF01468E),
      primaryColorDark: const Color(0xFF01468E),
      primaryColorLight: const Color(0xFFABCAEC),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, color: Color(0xFF01468E)),
          displayMedium: TextStyle(fontSize: 20, color: Color(0xFF01468E)),
          displaySmall: TextStyle(fontSize: 16, color: Color(0xFF01468E))),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF01468E),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF135F13),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFF990B01),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFFF5F5F5),
          onBackground: Color(0xFF000000),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF000000)));

  static var darkTheme = ThemeData(
      primaryColor: const Color(0xFFABCAEC),
      primaryColorDark: const Color(0xFF01468E),
      primaryColorLight: const Color(0xFFABCAEC),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFABCAEC),
          onPrimary: Color(0xFF000000),
          secondary: Color(0xFF135F13),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFF990B01),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFF3D3D3D),
          onBackground: Color(0xFFFFFFFF),
          surface: Color(0xFF646464),
          onSurface: Color(0xFFFFFFFF)));
}
