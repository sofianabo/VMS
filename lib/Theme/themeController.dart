import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/main.dart';

class ThemeController extends GetxController {
  static bool get isDarkMode => prefs!.getBool("mode") ?? false;

  static set isDarkMode(bool v) {
    prefs!.setBool("mode", v);
    Get.find<ThemeController>().changeThemes(v);
  }

  static ThemeMode get defaultTheme =>
      isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void changeThemes(bool isDark) {
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
