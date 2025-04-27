import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCuriculmController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/DropDownCuriculmModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdownexamcuriculmapi {
  Dropdowncuriculmcontroller c = Get.find<Dropdowncuriculmcontroller>();
  Dropdownclassescontroller class_controller =
      Get.find<Dropdownclassescontroller>();

  BuildContext context;

  Dropdownexamcuriculmapi(this.context);
  Dio dio = Dio();

  Dropdownexamcuriculm(int idx) async {
    try {
      int? id = class_controller.Allclass[idx].id;
      Get.find<ExamTableController>().setisCurriculmLoading(true);
      Get.find<AdminSchoolTimeController>().SetisLoadingcurr(true);
      String myurl = "${global.hostPort}${global.getCurriculum}";
      var response = await dio
          .post(data: {"classId": id}, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        DropDowmCuriculmModel curi =
            DropDowmCuriculmModel.fromJson(response.data);
        c.setCuriculm(curi);
        Get.find<ExamTableController>().setisCurriculmLoading(false);
        Get.find<AdminSchoolTimeController>().SetisLoadingcurr(false);
        return curi;
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
