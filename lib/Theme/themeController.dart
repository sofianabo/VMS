import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  static ThemeData lighttheme = ThemeData(
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: DatePickerThemeData(
      surfaceTintColor: Colors.white
    ),
    primaryColor: Color(0xff19478d),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Color(0xff134B70),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff134B70),
        secondary: Color(0xff7c9fb9)),
    fontFamily: "Cairo",
    primaryTextTheme: TextTheme(
      //normal Text & table cells & second title in dialog
      bodySmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      //Secondary Title & table column
      bodyMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Primary Title & main title in dialog
      bodyLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Text in Button
      headlineSmall: TextStyle(
          fontFamily: "Cairo",
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      // Roll & other info in dialog or grid & Home Section appbar && signin in home screen
      titleSmall: TextStyle(
          fontFamily: "Cairo",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 16),
      //Pages Titles & title in Home section
      titleLarge: TextStyle(
          fontFamily: "Cairo",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 28),
      // present & successful & full time
      displaySmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
      //Male
      displayMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
//female
      displayLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
      // Main text in Home Screen
      labelLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 46,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),

      //label text field
      labelSmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      // dropdown text & hint text
      titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Cairo",
      ),
      //main cell in table
      labelMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xff19478d)),
      //footer
    ),
  );

  static ThemeData darktheme = ThemeData(
    fontFamily: "Cairo",
    primaryColor: Color(0xff19478d),
    canvasColor: Color(0xff3C3F41),
    scaffoldBackgroundColor: Color(0xff2B2B2B),
    colorScheme: ColorScheme.dark(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff7c9fb9),
        secondary: Color(0xff7c9fb9)),
    primaryTextTheme: TextTheme(
      //normal Text & table cells & second title in dialog
      bodySmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      //Secondary Title & table column
      bodyMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Primary Title & main title in dialog
      bodyLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      //Text in Button
      headlineSmall: TextStyle(
          fontFamily: "Cairo",
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      // Roll & other info in dialog or grid & Home Section appbar && signin in home screen
      titleSmall: TextStyle(
          fontFamily: "Cairo",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 16),
      //Pages Titles & title in Home section
      titleLarge: TextStyle(
          fontFamily: "Cairo",
          color: Color(0xff19478d),
          fontWeight: FontWeight.bold,
          fontSize: 28),
      // present & successful & full time
      displaySmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
      //Male
      displayMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
//female
      displayLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),
      // Main text in Home Screen
      labelLarge: TextStyle(
          fontFamily: "Cairo",
          fontSize: 46,
          fontWeight: FontWeight.bold,
          color: Color(0xff19478d)),

      //label text field
      labelSmall: TextStyle(
          fontFamily: "Cairo",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      // dropdown text & hint text
      titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Cairo",
      ),
      //main cell in table
      labelMedium: TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xff19478d)),
      //footer
    ),
  );

  ThemeData get currentTheme {
    return isDarkMode.value ? darktheme : lighttheme;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    prefs?.setBool("mode", isDarkMode.value);

    Get.changeTheme(currentTheme);
  }

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = prefs?.getBool("mode") ?? false;
  }
}
