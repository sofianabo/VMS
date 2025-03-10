import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Routs/AppRouts.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/Translate/local_controller.dart'
    show LocalizationController, localeController;
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/link/Bindings/UserBinding.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Translate/local.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  final localizationController = LocalizationController();
  await localizationController.loadLanguageFromCache();
  runApp(VMS(localizationController: localizationController));
}

class VMS extends StatelessWidget {
  final LocalizationController localizationController;
  final ThemeController themeController = Get.put(ThemeController());
  VMS({Key? key, required this.localizationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: UserBiniding(),
      locale: localizationController.currentLocale.value,
      translations: MyTranslations(),
      fallbackLocale: const Locale('ar'),
      theme: theme.Light_Theme,
      themeMode: ThemeController.defaultTheme,
      darkTheme: theme.Dark_Theme,
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => Languages.translations;
}
