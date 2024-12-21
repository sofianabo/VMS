import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Class_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Link/Controller/HomeScreenController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DateControler.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDownController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSemsterController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSessionController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/PasswordHintController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Theme/themeController.dart';

class UserBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      () => ThemeController(),
      builder: () => ThemeController(),
    );
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => PasswordHintController(), fenix: true);
    Get.lazyPut(() => AdminHomeContentController(), fenix: true);
    Get.lazyPut(() => Homescreencontroller(), fenix: true);
    Get.lazyPut(() => ExamTableController(), fenix: true);
    Get.lazyPut(() => Requestscontroller(), fenix: true);
    Get.lazyPut(() => DropDownController(), fenix: true);
    Get.lazyPut(() => Allgaurdiancontroller(), fenix: true);
    Get.lazyPut(() => Allteachercontroller(), fenix: true);
    Get.lazyPut(() => Allstudentscontroller(), fenix: true);
    Get.lazyPut(() => Student_attendence_controller(), fenix: true);
    Get.lazyPut(() => EmployeeController(), fenix: true);
    Get.lazyPut(() => AdminSchoolTimeController(), fenix: true);
    Get.lazyPut(() => StudyYearStudentsController(), fenix: true);
    Get.lazyPut(() => StudentAttendencController(), fenix: true);
    Get.lazyPut(() => SessionController(), fenix: true);
    Get.lazyPut(() => Grade_Controller(), fenix: true);
    Get.lazyPut(() => ClassMgmtController(), fenix: true);
    Get.lazyPut(() => Divisions_Controller(), fenix: true);
    Get.lazyPut(() => Curriculumn_Controller(), fenix: true);
    Get.lazyPut(() => SchoolInfoController(), fenix: true);
    Get.lazyPut(() => Dropdownsessioncontroller(), fenix: true);
    Get.lazyPut(() => Dropdowngradecontroller(), fenix: true);
    Get.lazyPut(() => Dropdownclassescontroller(), fenix: true);
    Get.lazyPut(() => Allempolyeecontroller(), fenix: true);
    Get.lazyPut(() => Labrary_Controller(), fenix: true);
    Get.lazyPut(() => Dropdowndivisioncontroller(), fenix: true);
    Get.lazyPut(() => DatePickerController(), fenix: true);
    Get.lazyPut(() => IllnessController(), fenix: true);
    Get.lazyPut(() => Dashboard_Controller(), fenix: true);
    Get.lazyPut(() => AddFullEmployeeController(), fenix: true);
    Get.lazyPut(() => All_Screen_Sessions_Controller(), fenix: true);
    Get.lazyPut(() => Dropdownexamtypecontroller(), fenix: true);
    Get.lazyPut(() => Onestudentattendencecontroller(), fenix: true);
    Get.lazyPut(() => Dropdownpenaltycontroller(), fenix: true);
    Get.lazyPut(() => Dropdownsemstercontroller(), fenix: true);
    Get.lazyPut(() => Virtual_Employee_Controller(), fenix: true);
    Get.lazyPut(() => Virtual_Employee_Class_Controller(), fenix: true);
    Get.lazyPut(() => Employeeattendencecontroller(), fenix: true);
    Get.lazyPut(() => Oneemployeeattendencecontroller(), fenix: true);
    Get.lazyPut(() => Subject_Controller(), fenix: true);
    Get.lazyPut(() => Allteacheratendencecontroller(), fenix: true);
  }
}
