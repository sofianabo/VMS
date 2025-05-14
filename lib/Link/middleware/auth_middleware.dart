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

    if (isLoggedIn &&
        role != "admin" &&
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

Future<void> CheeckHasData() async {
  try {
    final con = Get.put(Add_Data_controller());
    final con2 = Get.put(Admin_Profile_Content());
    final prefs = await SharedPreferences.getInstance();
    final hasData = prefs.getBool("hasData") ?? false;
    final isVerified = prefs.getBool("isVerified") ?? false;
    final email = prefs.getString("email") ?? "";
    final role = prefs.getString("role") ?? "";

    con.setisVerified(isVerified);
    con.sethasData(hasData);
    con.setEmail(email);
    con.setroll(role);

    if (!isVerified) {
      await showVerificationDialog();
    }

    if (!hasData) {
      await handleDataLoading(con2);
    }

    if (role == "observer") {
      Get.find<AdminHomeContentController>()
          .updateContent("School Data Management");
    }
  } catch (e) {
    print('Error in CheeckHasData: $e');
    rethrow;
  }
}

Future<void> showVerificationDialog() async {
  await Get.dialog(
    VerifingCodeDialog(),
    barrierDismissible: false,
  );
}

Future<void> handleDataLoading(Admin_Profile_Content con2) async {
  await Get_My_Profile.Get_My_Profile_Data();
  Get.find<AdminHomeContentController>().updateContent("My Profile");
  con2.ChangeCurruntValue("addData");
}

CheeckGuaIsVeri() async {
  final con = Get.find<Add_Data_controller>();
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
