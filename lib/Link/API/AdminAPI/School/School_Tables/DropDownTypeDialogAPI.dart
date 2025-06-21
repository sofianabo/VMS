import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableDialogController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownSemsterController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdowntypedialogapi {
  Examtabledialogcontroller c = Get.find<Examtabledialogcontroller>();
  Allquizcontroller q = Get.find<Allquizcontroller>();
  Dropdownsemstercontroller semster = Get.find<Dropdownsemstercontroller>();
  BuildContext context;

  Dropdowntypedialogapi(this.context);
  Dio dio = Dio();

  Dropdowntypedialog(int ids) async {
    try {
      int? id = semster.allSemester[ids].id;
      Get.find<Examtabledialogcontroller>().setisTypeLoading(true);
      Get.find<Allquizcontroller>().setisTypeLoading(true);
      String myurl = "${global.hostPort}${global.examType}/$id";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllExamTypeModel types = AllExamTypeModel.fromJson(response.data);

        c.setAllTypesDialog(types);
        q.setAllTypesDialog(types);
        Get.find<Dropdownexamtypecontroller>().setTypes(types);

        return types;
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
