import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownExamTypeController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllExamTypeModel.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdownexamtypeapi {
  Dropdownexamtypecontroller c = Get.find<Dropdownexamtypecontroller>();
  BuildContext context;
  Dropdownexamtypeapi(this.context);
  Dio dio = Dio();

  Dropdownexamtype() async {
    try {
      String myurl = "${global.hostPort}${global.examType}";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllExamTypeModel types = AllExamTypeModel.fromJson(response.data);
        c.setTypes(types);
        return types;
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
