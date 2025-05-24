import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/All_Settings/Verifing_Code_Dialog.dart';

import '../Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';

class RoleBasedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = prefs?.getBool("isLogin") ?? false;
    String? role = prefs?.getString("role");
    if (!isLoggedIn &&
        route != '/home' &&
        route != '/login' &&
        route != '/enroll') {
      return const RouteSettings(name: '/home');
    }

    if (isLoggedIn &&
        (role == "admin" || role == "subAdmin" || role == "observer")) {
      Get.find<Add_Data_controller>().CheeckHasData();
      if (route != '/admin') {
        return const RouteSettings(name: '/admin');
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

    if (isLoggedIn &&
        role != "admin" &&
        role != "teacher" &&
        role != "subAdmin" &&
        role != "observer" &&
        role != "guardian") {
      if (route == '/admin' || route == '/guardian') {
        return const RouteSettings(name: '/home');
      }
    }
    return null;
  }
}
