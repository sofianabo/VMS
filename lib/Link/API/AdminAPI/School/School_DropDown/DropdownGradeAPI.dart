import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import '../../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Getallgradeapi {
  Dropdowngradecontroller c = Get.find<Dropdowngradecontroller>();
  BuildContext context;
  Getallgradeapi(this.context);
  Dio dio = Dio();

  Getallgrade() async {
    try {
      String myurl = "${global.hostPort}${global.getGrade}";
      var response = await dio.get(myurl,
options: getDioOptions());
      if (response.statusCode == 200) {
        AllGradesModel grade = AllGradesModel.fromJson(response.data);
        c.setGrades(grade);
        return grade;
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
