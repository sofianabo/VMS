import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/Link/Controller/AdminController/AdminStudentsAttendens.dart';
import 'package:getx/Link/Controller/AdminController/AdminTeacherAttendens.dart';
import 'package:getx/Link/Controller/AdminController/AllClassesController.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/AllTeachersController.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';
import 'package:getx/Link/Controller/AdminController/DropDownDivisions_Controller.dart';
import 'package:getx/Link/Controller/AdminController/Employeeecontroller.dart';
import 'package:getx/Link/Controller/AdminController/Grade_Controller.dart';
import 'package:getx/Link/Controller/AdminController/RequestsController.dart';
import 'package:getx/Link/Controller/AdminController/Session_Controller.dart';
import 'package:getx/Link/Controller/AdminController/Student_Attendenc_Controller.dart';
import 'package:getx/Link/Controller/AdminController/StudyYearStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/Link/Controller/AuthController/UserController.dart';
import 'package:getx/Link/Controller/HomeScreenController.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Controller/WidgetController/PasswordHintController.dart';
import 'package:getx/Link/Controller/AdminController/Admin_School_Time.dart';

class UserBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => PasswordHintController(), fenix: true);
    Get.lazyPut(() => AdminHomeContentController(), fenix: true);
    Get.lazyPut(() => Homescreencontroller(), fenix: true);
    Get.lazyPut(() => Allclassescontroller(), fenix: true);
    Get.lazyPut(() => Requestscontroller(), fenix: true);
    Get.lazyPut(() => DropDownController(), fenix: true);
    Get.lazyPut(() => Allgaurdiancontroller(), fenix: true);
    Get.lazyPut(() => Allteachercontroller(), fenix: true);
    Get.lazyPut(() => Allstudentscontroller(), fenix: true);
    Get.lazyPut(() => TeacherAttendensController(), fenix: true);
    Get.lazyPut(() => Studentattcontroller(), fenix: true);
    Get.lazyPut(() => EmployeeController(), fenix: true);
    Get.lazyPut(() => AdminSchoolTimeController(), fenix: true);
    Get.lazyPut(() => StudyYearStudentsController(), fenix: true);
    Get.lazyPut(() => StudentAttendencController(), fenix: true);
    Get.lazyPut(() => SessionController(), fenix: true);
    Get.lazyPut(() => Grade_Controller(), fenix: true);
    Get.lazyPut(() => ClassMgmtController(), fenix: true);
    Get.lazyPut(() => DropdownDivisions_Controller(), fenix: true);
  }
}
