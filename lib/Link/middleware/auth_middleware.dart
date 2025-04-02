import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/main.dart';

class RoleBasedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = prefs?.getBool("isLogin") ?? false;
    String? role = prefs?.getString("role");

    if (!isLoggedIn) {
      return const RouteSettings(name: '/home');
    }

    if (role == "admin" || role == "subAdmin") {
      return const RouteSettings(name: '/admin');
    } else {
      return const RouteSettings(name: '/home');
    }
  }
}
