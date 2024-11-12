import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Translate/local_controller.dart' show localeController;
import 'package:getx/Theme/themeController.dart';
import 'package:getx/link/Bindings/UserBinding.dart';
import 'package:getx/view/website/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Translate/local.dart';

SharedPreferences? Username;
SharedPreferences? Password;
SharedPreferences? lang;
SharedPreferences? mode;
SharedPreferences? tokenPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Username = await SharedPreferences.getInstance();
  Password = await SharedPreferences.getInstance();
  lang = await SharedPreferences.getInstance();
  mode = await SharedPreferences.getInstance();
  tokenPref = await SharedPreferences.getInstance();

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
      home: Directionality(textDirection: TextDirection.rtl, child: Home()),
    );
  }
}
