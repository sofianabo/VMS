import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    // إذا كان مسجل دخول وله صلاحيات admin
    if (isLoggedIn &&
        (role == "admin" || role == "subAdmin" || role == "observer")) {
      CheeckHasData();
      if (route != '/admin') {
        return const RouteSettings(name: '/admin');
      }
    }

    if (isLoggedIn && (role == "guardian")) {
      CheeckGuaIsVeri();
      if (route != '/guardian') {
        return const RouteSettings(name: '/guardian');
      }
    }

    // إذا كان مسجل دخول ولكن ليس له صلاحيات admin
    if (isLoggedIn &&
        role != "admin" &&
        role != "subAdmin" &&
        role != "observer" &&
        role != "guardian") {
      if (route == '/admin' || route == '/guardian') {
        return const RouteSettings(name: '/home');
      }
    }

    return null; // يسمح بالاستمرار إذا لم يكن هناك تحويل مطلوب
  }
}

CheeckHasData() {
  final con = Get.put(Add_Data_controller());
  final con2 = Get.put(Admin_Profile_Content());
  bool? hasData = prefs!.getBool("hasData");
  bool? isVerified = prefs!.getBool("isVerified");
  String? email = prefs!.getString("email");
  con.setisVerified(isVerified ?? false);
  con.sethasData(hasData ?? false);
  con.setEmail(email!);
  con.setroll(prefs!.getString("role") ?? "");
  if (con.isVerified == true) {
    if (con.hasData == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        con2.ChangeCurruntValue("addData");
        Get.find<AdminHomeContentController>().updateContent("My Profile");
        Get_My_Profile.Get_My_Profile_Data();
      });
    }
  } else {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        VerifingCodeDialog(),
        barrierDismissible: false,
      );
    });
    if (con.hasData == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        con2.ChangeCurruntValue("addData");
        Get.find<AdminHomeContentController>().updateContent("My Profile");
        Get_My_Profile.Get_My_Profile_Data();
      });
    }
  }
}

CheeckGuaIsVeri() {
  final con = Get.put(Add_Data_controller());
  final myChildren_Controller = Get.put(MyChildren_Controller());
  bool? isVerified = prefs!.getBool("isVerified");
  String? name = prefs!.getString("fullname");
  myChildren_Controller.Setname(name ?? "");
  con.setisVerified(isVerified ?? false);
  con.setroll(prefs!.getString("role") ?? "");
  if (con.isVerified == false) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        VerifingCodeDialog(),
        barrierDismissible: false,
      );
    });
  }
}
