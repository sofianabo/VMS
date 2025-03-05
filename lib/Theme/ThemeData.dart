import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class theme {
  static String IsAr =
      Get.put(LocalizationController()).currentLocale.value.languageCode == 'ar'
          ? "Cairo"
          : "Sansation";
  static ThemeData Light_Theme = ThemeData(
    fontFamily: IsAr,
    cardColor: const Color(0xffFBFBFB),
    primaryColorLight: const Color(0xff19478d), // card button
    primaryColor: const Color(0xff19478d),
    scaffoldBackgroundColor: Colors.white,
    indicatorColor: Color(0xffD4DFE5),
    primaryColorDark: Color(0xffF6F6F6),
    dialogBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    highlightColor: const Color(0xff19478d),
    canvasColor: const Color(0xff134B70),
    disabledColor: Color(0xffBABDC6),
    textTheme: TextTheme(
        bodySmall:
            TextStyle(color: Color(0xffa3a6af), fontFamily: IsAr, fontSize: 14),
        displayLarge:
            TextStyle(fontSize: 26, color: Colors.black, fontFamily: IsAr),
        bodyMedium:
            TextStyle(color: Colors.black, fontFamily: IsAr, fontSize: 14),
        titleLarge:
            TextStyle(color: Color(0xff134B70), fontFamily: IsAr, fontSize: 14),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff134B70),
            fontFamily: IsAr,
            fontSize: 24),
        headlineLarge: TextStyle(
          fontFamily: IsAr,
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: IsAr, fontSize: 14)),
    focusColor: Colors.white,
    colorScheme: const ColorScheme.light(
        primary: Color(0xff19478d),
        onPrimary: Color(0xffEAF0FF),
        secondary: Color(0xff7c9fb9)),
    popupMenuTheme: PopupMenuThemeData(
        textStyle: TextStyle(
          fontFamily: IsAr,
        ),
        color: Colors.white,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(
          color: Colors.black,
          fontFamily: IsAr,
        ))),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,

      dayOverlayColor: WidgetStatePropertyAll(Color(0xff19478d)),
      // todayBackgroundColor: WidgetStatePropertyAll(Color(0xff19478d))
    ),
  );

  static ThemeData Dark_Theme = ThemeData(
    fontFamily: IsAr,
    primaryColorDark: Color(0xff252525),
    primaryColorLight: const Color.fromARGB(255, 29, 28, 28),
    cardColor: const Color(0xff464646),
    highlightColor: Colors.white,
    indicatorColor: Color.fromARGB(255, 57, 60, 61),
    popupMenuTheme: PopupMenuThemeData(
        color: Color(0xff464646),
        labelTextStyle: WidgetStatePropertyAll(
            TextStyle(fontFamily: IsAr, color: Colors.white))),
    scaffoldBackgroundColor: const Color(0xff1A1A1B),
    canvasColor: const Color(0xff252525),
    focusColor: const Color(0xff1A1A1B),
    secondaryHeaderColor: Colors.white,
    disabledColor: Color(0xffBABDC6),
    textTheme: TextTheme(
        bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: IsAr,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        bodyMedium:
            TextStyle(color: Colors.white, fontFamily: IsAr, fontSize: 14),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: IsAr, fontSize: 14),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: IsAr,
            fontSize: 24),
        headlineLarge: TextStyle(
          fontFamily: IsAr,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        displayLarge:
            TextStyle(fontFamily: IsAr, fontSize: 26, color: Colors.white),
        titleLarge:
            TextStyle(color: Colors.blueGrey, fontFamily: IsAr, fontSize: 14)),
    dialogBackgroundColor: Colors.white.withOpacity(0.3),
    primaryColor: const Color(0xff464646),
    useMaterial3: true,
    cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: IsAr),
            dateTimePickerTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: IsAr,
            ),
            pickerTextStyle: TextStyle(
                fontFamily: IsAr, color: Colors.white, fontSize: 16))),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff464646),
        secondary: Color(0xff252323)),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,
      dayOverlayColor: WidgetStatePropertyAll(Color(0xff464646)),
      todayBackgroundColor: WidgetStatePropertyAll(
        Color(0xff464646),
      ),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
      dayForegroundColor: WidgetStatePropertyAll(Colors.white),
      cancelButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
      confirmButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
    ),
  );
}
