import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCuriculmController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import '../../API.dart' as global;

class Addquizlmsapi {
  Allquizcontroller u = Get.find<Allquizcontroller>();

  Curriculumn_LMS_Controller curi = Get.find<Curriculumn_LMS_Controller>();
  Dropdownexamtypecontroller type = Get.find<Dropdownexamtypecontroller>();
  Addquizlmsapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Addquizlms(
    int curriculumId,
    int typeId,
    String startDate,
    String period,
    String name,
    bool hidden,
    String maxMark,
    String PassingMark,
  ) async {
    String myurl = "${global.hostPort}${global.addQuizLms}";
    try {
      int? curiID = curi.curriculum![curriculumId].id;
      int? typeID = type.alltype[typeId].id;
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "curriculumId": curiID,
            "typeId": typeID,
            "startDate": startDate,
            "period": period,
            "name": name,
            "hidden": hidden ? 1 : 0,
            "maxMark": maxMark,
            "PassingMark": PassingMark,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        AllQuizLmsModel quesModel = AllQuizLmsModel.fromJson(response.data);
        u.Add_Quiz(quesModel.quizLms![0]);
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
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
