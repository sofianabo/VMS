import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/main.dart';

class RoleBasedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = prefs?.getBool("isLogin") ?? false;
    String? role = prefs?.getString("role");

    // إذا لم يكن مسجل دخول ويحاول الوصول إلى صفحة غير مسموحة
    if (!isLoggedIn && route != '/home' && route != '/login') {
      return const RouteSettings(name: '/home');
    }

    // إذا كان مسجل دخول وله صلاحيات admin
    if (isLoggedIn && (role == "admin" || role == "subAdmin")) {
      if (route != '/admin') {
        return const RouteSettings(name: '/admin');
      }
    }

    // إذا كان مسجل دخول ولكن ليس له صلاحيات admin
    if (isLoggedIn && role != "admin" && role != "subAdmin") {
      if (route == '/admin') {
        return const RouteSettings(name: '/home');
      }
    }

    return null; // يسمح بالاستمرار إذا لم يكن هناك تحويل مطلوب
  }
}
