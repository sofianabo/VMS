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
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
      //Secondary Title & table column 
      bodyMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      //Primary Title & main title in dialog
      bodyLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      //Text in Button 
      headlineSmall: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      // Roll & other info in dialog or grid & Home Section appbar && signin in home screen
      titleSmall: TextStyle(
          color: Color(0xff19478d), fontWeight: FontWeight.bold, fontSize: 16),
      //Pages Titles & title in Home section
      titleLarge: TextStyle(
          color: Color(0xff19478d), fontWeight: FontWeight.bold, fontSize: 28),
      // present & successful & full time
      displaySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.green),
      //Male
      displayMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff19478d)),
//female
      displayLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 226, 37, 147)),
      // Main text in Home Screen
      labelLarge: TextStyle(
          fontSize: 46, fontWeight: FontWeight.bold, color: Color(0xff19478d)),
      //second text in home screen
      labelMedium: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff7c9fb9)),
           //label text field 
           labelSmall: TextStyle(
            fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black
           ),

      //footer
    ),
  );
}
