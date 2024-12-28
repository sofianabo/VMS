import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallclassapi {
  Dropdownclassescontroller ClassController = Get.find<Dropdownclassescontroller>();
  final DivisionControllers = Get.find<Dropdowndivisioncontroller>();
  final Studentcontroller = Get.find<Allstudentscontroller>();
  final StudyYearStudents = Get.find<StudyYearStudentsController>();
  final Student_attendence = Get.find<Student_attendence_controller>();
  final Allteachercontrolle = Get.find<Allteachercontroller>();
  final Allteacheratendencecontrolle = Get.find<Allteacheratendencecontroller>();

  BuildContext context;
  Getallclassapi(this.context);
  Dio dio = Dio();
  getAllClasses( {int? sessionID,int? Gradeid}) async {
    try {

      ClassController.setIsLoading(true);
      Studentcontroller.setClassLoading(true);
      StudyYearStudents.setClassLoading(true);
      Student_attendence.setClassLoading(true);
      Allteachercontrolle.setClassLoading(true);
      Allteacheratendencecontrolle.setClassLoading(true);


      final controller = Get.find<Divisions_Controller>();
      controller.SetIsloading(true);
      String myurl = "${global.hostPort}${global.getclasses}";
      var response = await dio.post(myurl, options: getDioOptions(),
        data: {
        "sessionId": sessionID,
        "gradeId": Gradeid,
        },
      );
      if (response.statusCode == 200) {
        AllClassModel classes = AllClassModel.fromJson(response.data);
        ClassController.setClasses(classes);
        controller.setClass(classes);
        return classes;
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
