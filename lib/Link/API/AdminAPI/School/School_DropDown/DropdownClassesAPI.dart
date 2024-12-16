import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallclassapi {
  Dropdownclassescontroller c = Get.find<Dropdownclassescontroller>();

  BuildContext context;
  Getallclassapi(this.context);
  Dio dio = Dio();
  getAllClasses() async {
    try {
      final controller = Get.find<DropdownDivisions_Controller>();
      controller.SetIsloading(true);
      String myurl = "${global.hostPort}${global.getclasses}";
      var response = await dio.post(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllClassModel classes = AllClassModel.fromJson(response.data);
        c.setClasses(classes);
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
