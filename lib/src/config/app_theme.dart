import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData style() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          shadowColor: Color.fromRGBO(158, 158, 158, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(251,249,249,1),
        primaryColor: const Color.fromRGBO(243,250,255, 1),
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3F3F3F),
            ),
            headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3F3F3F),
            ),
            headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF3F3F3F),
            ),
            //usage:
            //label in account-view
            titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3F3F3F),
            ),
            //usage:
            //text in account-view
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF3F3F3F),
            ),
            bodyLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xff324553)),
            bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xff324553)),
            bodySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xff324553))));
  }
}