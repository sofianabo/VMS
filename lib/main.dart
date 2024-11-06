import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Translate/local_controller.dart' show localeController;
import 'package:getx/Theme/themeController.dart';
import 'package:getx/view/Auth/login.dart';
import 'package:getx/view/website/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Translate/local.dart';

SharedPreferences? Username;
SharedPreferences? Password;
SharedPreferences? lang;
SharedPreferences? mode;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Username = await SharedPreferences.getInstance();
  Password = await SharedPreferences.getInstance();
  lang = await SharedPreferences.getInstance();
  mode = await SharedPreferences.getInstance();
  
  runApp(const VMS());
}

class VMS extends StatelessWidget {
  const VMS({super.key});
  @override
  Widget build(BuildContext context) {
    localeController loc = Get.put(localeController(), permanent: true);
    themeController th = Get.put(themeController(), permanent: true);
    final DropDownController controller = Get.put(DropDownController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocal(),
      locale: loc.init,
      theme: th.changebool(),
      home: Directionality(textDirection: TextDirection.rtl, child: Home()),
    );
  }
}
