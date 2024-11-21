import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Translate/local_controller.dart' show localeController;
import 'package:getx/Theme/themeController.dart';
import 'package:getx/link/Bindings/UserBinding.dart';
import 'package:getx/view/Admin/AdminHome.dart';
import 'package:getx/view/website/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Translate/local.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(VMS());
}

class VMS extends StatelessWidget {
  VMS({super.key});

  ThemeController th = Get.put(ThemeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    localeController loc = Get.put(localeController(), permanent: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocal(),
      initialBinding: UserBiniding(),
      locale: loc.init,
        theme: th.currentTheme,
        home: prefs!.getBool("isLogin") != null &&
                prefs!.getBool("isLogin") == true
            ? AdminHome()
            : Directionality(textDirection: TextDirection.rtl, child: Home()));
  }
}
