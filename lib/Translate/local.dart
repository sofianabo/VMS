import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "Login": " تسجيل الدخول",
        },
        "en": {
          "Login": "Login",
           }
      };
}
