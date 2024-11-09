// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class theme {
  static ThemeData darktheme = ThemeData.dark().copyWith();

  static ThemeData lighttheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Color(0xff19478d), secondary: Color(0xff7c9fb9)),
    primaryTextTheme: const TextTheme(
      //normal Text & table cells & second title in dialog
      bodySmall: TextStyle(
          fontFamily: "Sansation",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      //Secondary Title & table column
      bodyMedium: TextStyle(
          fontFamily: "Sansation",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Primary Title & main title in dialog
      bodyLarge: TextStyle(
          fontFamily: "Sansation",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Text in Button
      headlineSmall: TextStyle(
          fontFamily: "Sansation",
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      // Roll & other info in dialog or grid & Home Section appbar && signin in home screen
      titleSmall: TextStyle(
          fontFamily: "Sansation",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 16),
      //Pages Titles & title in Home section
      titleLarge: TextStyle(
          fontFamily: "Sansation",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 28),
      // present & successful & full time
      displaySmall: TextStyle(
          fontFamily: "Sansation",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.green),
      //Male
      displayMedium: TextStyle(
          fontFamily: "Sansation",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
//female
      displayLarge: TextStyle(
          fontFamily: "Sansation",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 226, 37, 147)),
      // Main text in Home Screen
      labelLarge: TextStyle(
          fontFamily: "Sansation",
          fontSize: 46,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),

      //label text field
      labelSmall: TextStyle(
          fontFamily: "Sansation",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      // dropdown text & hint text
      titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Sansation",
      ),
      //main cell in table
      labelMedium: TextStyle(
          fontFamily: "Sansation",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xff19478d)),
      //footer
    ),
  );
}
