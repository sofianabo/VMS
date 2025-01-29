// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../main.dart';

// class ThemeController extends GetxController {
//   RxBool isDarkMode = false.obs;

//   void loadTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     isDarkMode.value = prefs.getBool('mode') ?? false;
//     update();
//   }

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     prefs?.setBool("mode", isDarkMode.value);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     isDarkMode.value = prefs?.getBool("mode") ?? false;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/main.dart';

class Themecontroller extends GetxController {
  ThemeData? th;
  ThemeData CheckTheme() {
    if (prefs!.getBool("mode") == null) {
      prefs!.setBool("mode", false);
      th = theme.Light_Theme;
      Get.changeTheme(theme.Light_Theme);
      return theme.Light_Theme;
    } else if (prefs!.getBool("mode") == true) {
      th = theme.Dark_Theme;
      Get.changeTheme(theme.Dark_Theme);
      return theme.Dark_Theme;
    } else {
      th = theme.Light_Theme;
      Get.changeTheme(theme.Light_Theme);
      return theme.Light_Theme;
    }
  }

  changeThemeCustom(bool val) {
    prefs!.setBool("mode", val);
    CheckTheme();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    CheckTheme(); // تأكد من وجود هذا السطر
  }
}
