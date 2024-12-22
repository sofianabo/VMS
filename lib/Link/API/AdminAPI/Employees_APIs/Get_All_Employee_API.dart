import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Model/AdminModel/All_Employee_Model.dart';

class Get_All_Employee_API {

  Get_All_Employee_API(this.context);
  BuildContext context;

    static Get_All_Employee() async {
    Dio dio = Dio();
    final Allempolyeecontroller controller = Get.find<Allempolyeecontroller>();
    final EmployeeController AttendenceController = Get.find<EmployeeController>();
    controller.setIsLoading(true);
    AttendenceController.setIsload(true);
    String myurl = "${hostPort}${getAllEmployee}";
    try {
      var response = await dio.get( 
        myurl,
        options: getDioOptions(),
      );
      if (response.statusCode == 200) {
        AllEmployeeModel allEmployeeModel =
        AllEmployeeModel.fromJson(response.data);
        controller.setEmployee(allEmployeeModel);
        AttendenceController.setData(allEmployeeModel);
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
