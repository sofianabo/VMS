import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/GetAllGuardiansAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/RequestsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Approverequestapi {
  Approverequestapi(this.context);
  Requestscontroller requestscontroller = Get.find<Requestscontroller>();
  Dropdownclassescontroller classControl =
      Get.find<Dropdownclassescontroller>();
  Dropdowndivisioncontroller divisionControl =
      Get.find<Dropdowndivisioncontroller>();
  BuildContext context;
  Dio dio = Dio();
  Approverequest(
    int requestId,
    int studentId,
    int classid,
    int divisionId,
  ) async {
    try {
      int? cID = classControl.Allclass[classid].id;
      int? dID = divisionControl.allDivision[divisionId].id;
      String myurl = "${global.hostPort}${global.acceptARequest}";
      var response = await dio.post(myurl,
          data: {
            "classId": cID,
            "divisionId": dID,
            "studentId": studentId,
            "id": requestId
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        await GetAllRequestsapi(context).GetAllRequests();
        Get.back();
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
