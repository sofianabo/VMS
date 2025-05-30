import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/RequestsModel.dart';
import '../../../API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class GetAllRequestsapi {
  Requestscontroller c = Get.find<Requestscontroller>();
  BuildContext context;
  GetAllRequestsapi(this.context);
  Dio dio = Dio();

  GetAllRequests() async {
    try {
      c.SetIsloading(true);
      String myurl = "$hostPort$getRequests";
      var response = await dio.get(myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        AllRequestsModel requests = AllRequestsModel.fromJson(response.data);
        c.setAllRequests(requests);
        if (Get.find<Add_Data_controller>().roll != "registration" &&
            Get.find<Add_Data_controller>().roll != "accountant") {
          AllClassModel classesModel = await Getallclassapi.getAllClasses();
          c.setAllClassDialog(classesModel);
        }
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
