
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';

class AuthMidlleware extends GetMiddleware {
  @override

  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getString("islogin") != null) {
      return const RouteSettings(name: "/Home");
    }
  }
}
