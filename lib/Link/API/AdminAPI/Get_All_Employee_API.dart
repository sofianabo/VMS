import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/API.dart';
import 'package:getx/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/Link/Controller/AdminController/AllEmpolyeeController.dart';
import 'package:getx/Link/Model/AdminModel/All_Employee_Model.dart';
import 'package:getx/main.dart';

class Get_All_Employee_API {
  Get_All_Employee_API(this.context);

  BuildContext context;
  Dio dio = Dio();

  Get_All_Employee() async {
    final Allempolyeecontroller controller = Get.find<Allempolyeecontroller>();
    String myurl = "${hostPort}${getAllEmployee}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        AllEmployeeModel allEmployeeModel =
            AllEmployeeModel.fromJson(response.data);
        controller.setEmployee(allEmployeeModel);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
      return response.statusCode;
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