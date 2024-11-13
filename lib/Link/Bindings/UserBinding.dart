import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/Link/Controller/AdminController/AdminTeacherAttendens.dart';
import 'package:getx/Link/Controller/AdminController/AllClassesController.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/Link/Controller/AuthController/UserController.dart';
import 'package:getx/Link/Controller/HomeScreenController.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Controller/WidgetController/PasswordHintController.dart';

class UserBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => PasswordHintController(), fenix: true);
    Get.lazyPut(() => AdminHomeContentController(), fenix: true);
    Get.lazyPut(() => Homescreencontroller(), fenix: true);
    Get.lazyPut(() => DropDownController(), fenix: true);
    Get.lazyPut(() => Allclassescontroller(), fenix: true);
    Get.lazyPut(() => Allgaurdiancontroller(), fenix: true);
<<<<<<< HEAD
    Get.lazyPut(() => Allstudentscontroller(), fenix: true);
    Get.lazyPut(() => (), fenix: true);
=======
    Get.lazyPut(() => TeacherAttendensController(), fenix: true);
>>>>>>> 61168e7a2fcfc55999ba7bf28834de0aa75d982b
  }
}
