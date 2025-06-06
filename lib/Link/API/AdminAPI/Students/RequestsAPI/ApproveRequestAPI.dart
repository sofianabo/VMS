import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/RequestsAPI/RequestsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
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
    int? classid,
    int? divisionId,
  ) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      String myurl = "$hostPort$acceptARequest";

      // إنشاء بيانات الطلب الأساسية
      Map<String, dynamic> requestData = {
        "studentId": studentId,
        "id": requestId
      };

      // إضافة classId و divisionId فقط إذا تم توفيرهم
      if (classid != null) {
        int? cID = classControl.Allclass[classid].id;
        requestData["classId"] = cID;
      }

      if (divisionId != null) {
        int? dID = divisionControl.allDivision[divisionId].id;
        requestData["divisionId"] = dID;
      }

      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: requestData,
          options: getDioOptions());

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        await GetAllRequestsapi(context).GetAllRequests();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
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
