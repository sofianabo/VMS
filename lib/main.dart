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

  runApp(const VMS());
}

class VMS extends StatelessWidget {
  const VMS({super.key});
  @override
  Widget build(BuildContext context) {
    localeController loc = Get.put(localeController(), permanent: true);
    themeController th = Get.put(themeController(), permanent: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocal(),
      initialBinding: UserBiniding(),
      locale: loc.init,
      theme: th.changebool(),
        home: prefs!.getBool("isLogin") != null &&
                prefs!.getBool("isLogin") == true
            ? AdminHome()
            : Directionality(textDirection: TextDirection.rtl, child: Home()));
  }
}
