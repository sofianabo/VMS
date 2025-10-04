import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetNumberOfContentAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/main.dart';
import '../Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';

class RoleBasedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = prefs?.getBool("isLogin") ?? false;
    bool isLMS = prefs?.getBool("isLMS") ?? false;
    String? role = prefs?.getString("role");
    print('isLoggedIn: $isLoggedIn, role: $role, isLMS: $isLMS');
    if (!isLoggedIn &&
        route != '/home' &&
        route != '/login' &&
        route != '/enroll') {
      return const RouteSettings(name: '/home');
    }

    if (isLMS == false &&
        isLoggedIn &&
        (role == "admin" ||
            role == "subAdmin" ||
            role == "observer" ||
            role == "supervisor")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/admin') {
        return RouteSettings(name: '/admin');
      }
    }

    if (isLMS &&
        isLoggedIn &&
        (role == "admin" ||
            role == "teacher" ||
            role == "subAdmin" ||
            role == "observer" ||
            role == "supervisor")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/VMS_LMS') {
        return RouteSettings(name: '/VMS_LMS');
      }
    }
    if (isLoggedIn && (role == "class")) {
      prefs!.setBool("hasData", true);
      prefs!.setBool("isVerified", true);
      prefs!.setBool("isLMS", true);
      prefs!.setString("role", "class");
      if (route != '/Class_LMS') {
        return RouteSettings(name: '/Class_LMS');
      }
    }

    if (isLoggedIn && (role == "guardian")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/guardian') {
        return const RouteSettings(name: '/guardian');
      }
    }
    if (isLoggedIn && (role == "student")) {
      prefs!.setBool("hasData", true);
      prefs!.setBool("isVerified", true);
      prefs!.setBool("isLMS", true);
      prefs!.setString("role", "student");
      if (route != '/Student_LMS') {
        return const RouteSettings(name: '/Student_LMS');
      }
    }
    if (isLMS == false && isLoggedIn && (role == "teacher")) {
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
        role != "class" &&
        role != "guardian") {
      if (route == '/admin' || route == '/guardian') {
        return const RouteSettings(name: '/home');
      }
    }
    return null;
  }
}
