import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/Translate/local_controller.dart'
    show localeController;
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/link/Bindings/UserBinding.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import 'package:vms_school/view/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record.dart';
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
  localeController loc = Get.put(localeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    final Themecontroller themeController = Get.put(Themecontroller());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyLocal(),
        initialBinding: UserBiniding(),
        locale: loc.init,
        theme: themeController.CheckTheme(),
        home: prefs!.getBool("isLogin") != null &&
                prefs!.getBool("isLogin") == true
            ? AdminHome()
            : Teachers_notebook_grade_record()

        // home: AdminHome()

        );
  }
}
