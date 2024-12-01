import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  static ThemeData Light_Theme = ThemeData(
    cardColor: const Color(0xffFBFBFB),
    primaryColor: const Color(0xff19478d),
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    canvasColor: const Color(0xff134B70),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: "Cairo",
            fontSize: 14
        ),
        titleLarge: TextStyle(
            color: Color(0xff134B70),
            fontFamily: "Cairo",
            fontSize: 14
        ),
        displayMedium: TextStyle(
            color: Colors.white,
            fontFamily: "Cairo",
            fontSize: 14
        )
    ),
    fontFamily: "Cairo",
    focusColor: Colors.white,
    colorScheme: const ColorScheme.light(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff134B70),
        secondary: Color(0xff7c9fb9)),
    popupMenuTheme: const PopupMenuThemeData(
        color:Colors.white,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black))
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: const DatePickerThemeData(
        surfaceTintColor: Colors.white
    ),
    useMaterial3: true,
  );

  ThemeData Dark_Theme = ThemeData(
      cardColor: const Color(0xff464646),
      popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xff464646),
      labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))
    ),
      scaffoldBackgroundColor: const Color(0xff1A1A1B),
      canvasColor: const Color(0xff252525),
      focusColor: const Color(0xff1A1A1B),
      secondaryHeaderColor:  Colors.white,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white,
              fontFamily: "Cairo",
              fontSize: 14
          ),
          displayMedium: TextStyle(
              color: Colors.white,
              fontFamily: "Cairo",
              fontSize: 14
          ),
          titleLarge: TextStyle(
              color: Colors.white,
              fontFamily: "Cairo",
              fontSize: 14
          )
      ),
      fontFamily: "Cairo",
      dialogBackgroundColor:  Colors.white.withOpacity(0.3),
      primaryColor:const Color(0xff464646),
      useMaterial3: true,
      cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: TextStyle(color: Colors.white),
              pickerTextStyle:  TextStyle(color: Colors.white , fontSize: 16)
          )),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff134B70),
        secondary: Color(0xff252323)),
  );




  ThemeMode get currentTheme {
    return isDarkMode.value ?  ThemeMode.dark : ThemeMode.light ;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    prefs?.setBool("mode", isDarkMode.value);

  }

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = prefs?.getBool("mode") ?? false;
  }
}
