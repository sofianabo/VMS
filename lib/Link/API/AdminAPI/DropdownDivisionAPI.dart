import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/Link/Controller/AdminController/DropDownClassesController.dart';
import 'package:getx/Link/Controller/AdminController/DropDownDivisionController.dart';
import 'package:getx/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Dropdowndivisionapi {
  Dropdowndivisioncontroller c = Get.find<Dropdowndivisioncontroller>();

  Dropdownclassescontroller class_controller =
      Get.find<Dropdownclassescontroller>();
  BuildContext context;
  Dropdowndivisionapi(this.context);
  Dio dio = Dio();

  Dropdowndivision(int idx) async {
    try {
      int? id = class_controller.Allclass[idx].id;
      String myurl = "${global.hostPort}${global.getDivision}";
      var response = await dio.post(myurl,
          data: {"classId": id},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        AllDivisionModel division = AllDivisionModel.fromJson(response.data);
        c.setDivision(division);
        return division;
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
