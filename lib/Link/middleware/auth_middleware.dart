// ignore_for_file: body_might_complete_normally_nullable, implementation_imports

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';

class AuthMidlleware extends GetMiddleware {
  @override
  // int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (Username!.getString("username") != null &&
        Password!.getString("pass") != null) {
      return const RouteSettings(name: "/Home");
    }
  }
}
