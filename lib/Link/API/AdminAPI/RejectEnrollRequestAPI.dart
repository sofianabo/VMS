import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/RequestsAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Rejectenrollrequestapi {
  BuildContext context;
  Rejectenrollrequestapi(this.context);
  Dio dio = Dio();

  Rejectenrollrequest(int id) async {
    try {
      String myurl = "${global.hostPort}${global.rejectrequest}/$id";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        GetAllRequestsapi(context).GetAllRequests();
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
