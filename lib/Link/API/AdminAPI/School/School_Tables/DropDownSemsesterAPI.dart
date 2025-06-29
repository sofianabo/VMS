import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSemsterController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdownsemsesterapi {
  Dropdownsemstercontroller c = Get.find<Dropdownsemstercontroller>();
  BuildContext context;
  Dropdownsemsesterapi(this.context);
  Dio dio = Dio();

  Dropdownsemsester() async {
    try {
      String myurl = "${global.hostPort}${global.getSemester}";

      var ExamController = Get.find<ExamTableController>();
      var allquizcontroller = Get.find<Allquizcontroller>();
      ExamController.setisSemesterLoading(true);
      allquizcontroller.setisSemesterLoading(true);
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllSemesterModel sem = AllSemesterModel.fromJson(response.data);
        c.setsemester(sem);
        ExamController.setAllSeason(sem);
        allquizcontroller.setAllSeason(sem);

        ExamController.setisSemesterLoading(false);
        allquizcontroller.setisSemesterLoading(false);
        return sem;
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
