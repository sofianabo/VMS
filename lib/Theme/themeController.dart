import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Theme/themeMode.dart';

import '../main.dart';

class themeController extends GetxController {
  ThemeData? th;
  ThemeData changebool() {
    if (mode!.getBool("mode") == null) {
      mode!.setBool("mode", false);
      th = theme.lighttheme;
      Get.changeTheme(theme.lighttheme);
      return theme.lighttheme;
    } else if (mode!.getBool("mode") == true) {
      th = theme.darktheme;

      Get.changeTheme(theme.darktheme);
      return theme.darktheme;
    } else {
      th = theme.lighttheme;

      Get.changeTheme(theme.lighttheme);

      return theme.lighttheme;
    }
  }

  changetheme(bool val) {
    mode!.setBool("mode", val);
    changebool();
    update();
  }
  
}
