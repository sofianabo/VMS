import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/main.dart';
import '../Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';

class RoleBasedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = prefs?.getBool("isLogin") ?? false;
    bool isLMS = prefs?.getBool("isLMS") ?? false;
    String? role = prefs?.getString("role");
    if (!isLoggedIn &&
        route != '/home' &&
        route != '/login' &&
        route != '/enroll') {
      return const RouteSettings(name: '/home');
    }

    if (isLoggedIn &&
        (role == "admin" ||
            role == "subAdmin" ||
            role == "observer" ||
            role == "supervisor")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/admin' && route != '/adminLMS') {
        if (isLMS == true) {
          return const RouteSettings(name: '/adminLMS');
        } else {
          return const RouteSettings(name: '/admin');
        }
      }
    }

    if (isLoggedIn && (role == "guardian")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/guardian') {
        return const RouteSettings(name: '/guardian');
      }
    }
    if (isLoggedIn && (role == "teacher")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/teacher') {
        return const RouteSettings(name: '/teacher');
      }
    }
    if (isLoggedIn && (role == "registration")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/registration') {
        return const RouteSettings(name: '/registration');
      }
    }

    if (isLoggedIn &&
        role != "admin" &&
        role != "teacher" &&
        role != "subAdmin" &&
        role != "supervisor" &&
        role != "observer" &&
        role != "registration" &&
        role != "guardian") {
      if (route == '/admin' || route == '/guardian') {
        return const RouteSettings(name: '/home');
      }
    }
    return null;
  }
}
