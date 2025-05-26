import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Update_Employee_Info.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/My_Data_Model.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/All_Settings/Verifing_Code_Dialog.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/TeacherProfile.dart';

class Add_Data_controller extends GetxController {
  bool isLoading = true;
  MyData? myData;
  String? email;
  String? roll;

  @override
  void onInit() {
    CheeckHasData();
    print("Hello");
    super.onInit();
  }

  setIsloading(bool value) {
    isLoading = value;
    update();
  }

  setMyData(My_Profile_Data data) {
    myData = data.myData;
    update();
  }

  bool isVerified = false;
  bool hasData = false;

  Rx<DateTime?> Birthdate = Rx<DateTime?>(null);
  Rx<DateTime?> Joindate = Rx<DateTime?>(null);

  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Birthdate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      Get.find<Admin_Profile_Content>().updateFieldError("birth", false);

      Birthdate.value = picked;
    }
  }

  void selectJoinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Joindate.value ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      Joindate.value = picked;
    }
  }

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context, bool isUpdate) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      selectedImage.value = fileBytes;
      if (isUpdate == true) {
        Update_Employee_Information.Update_Employee_Info(
            selectedImage: selectedImage.value, Type: '');
      }
    }
    update();
  }

  void removeimage() {
    selectedImage.value = null;
    update();
  }

  void sethasData(bool value) {
    hasData = value;
    Get.find<AdminHomeContentController>().updateContent("My Profile");
    update();
  }

  void setroll(String value) {
    roll = value;
    update();
  }

  void setEmail(String value) {
    email = value;
    update();
  }

  void setisVerified(bool value) {
    isVerified = value;
    prefs!.setBool("isVerified", value);
    update();
  }

  bool ischeeck = false;

  Future<void> CheeckHasData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasData = prefs.getBool("hasData") ?? false;
      final hasDatas = prefs.getBool("hasData");
      final isVerified = prefs.getBool("isVerified") ?? false;
      final email = prefs.getString("email") ?? "";
      final role = prefs.getString("role") ?? "";

      setisVerified(isVerified);
      sethasData(hasData);
      setEmail(email);
      setroll(role);

      if (hasDatas != null && hasDatas == false) {
        Get_My_Profile.Get_My_Profile_Data();
        if (role == "teacher") {
          if (ischeeck == false) {
            Get.dialog(Teacherprofile(), barrierDismissible: false);
          }
          ischeeck = true;
        } else {
          Get.find<AdminHomeContentController>().updateContent("My Profile");
          Get.find<Admin_Profile_Content>().ChangeCurruntValue("addData");
        }
      }
      if (role == "admin" ||
          role == "subAdmin" ||
          role == "teacher" ||
          role == "supervisor" ||
          role == "registration") {
        if (!isVerified) {
          if (!Get.isDialogOpen!) {
            await showVerificationDialog();
          }
        }
        if (hasData) {
          if (role == "admin" || role == "subAdmin" || role == "supervisor") {
            Get.find<AdminHomeContentController>().updateContent("Dashboard");
          } else if (role == "registration") {
            Get.find<AdminHomeContentController>()
                .updateContent("Enroll Requests");
          }
        } else {
          Get.find<Admin_Profile_Content>().ChangeCurruntValue("addData");
        }
      }
      if (role == "observer") {
        Get.find<AdminHomeContentController>()
            .updateContent("School Data Management");
      }
      if (role == "guardian") {
        CheeckGuaIsVeri();
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

  CheeckGuaIsVeri() async {
    final con = Get.find<Add_Data_controller>();
    final myChildren_Controller = Get.put(MyChildren_Controller());
    bool? isVerified = prefs!.getBool("isVerified");
    String? name = prefs!.getString("fullname");
    myChildren_Controller.Setname(name ?? "");
    con.setisVerified(isVerified ?? false);
    con.setroll(prefs!.getString("role") ?? "");
    print(con.isVerified);
    if (con.isVerified == false) {
      if (!Get.isDialogOpen!) {
        await con.showVerificationDialog();
      }
    }
  }
}
