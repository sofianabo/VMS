import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart'
    show localeController;
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/link/Bindings/UserBinding.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import 'package:vms_school/view/website/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Translate/local.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(VMS());
}

class VMS extends StatefulWidget {
  VMS({super.key});

  @override
  State<VMS> createState() => _VMSState();
}

class _VMSState extends State<VMS> {
  ThemeController th = Get.put(ThemeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController =
        Get.put(ThemeController(), permanent: true);
    localeController loc = Get.put(localeController(), permanent: true);

    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyLocal(),
        initialBinding: UserBiniding(),
        locale: loc.init,
        darkTheme: themeController.Dark_Theme,
        theme: ThemeController.Light_Theme,
        themeMode: themeController.currentTheme,
        home: prefs!.getBool("isLogin") != null &&
                prefs!.getBool("isLogin") == true
            ? AdminHome()
            : Directionality(textDirection: TextDirection.rtl, child: Home())

        // home: AdminHome()

        ));
  }
}
