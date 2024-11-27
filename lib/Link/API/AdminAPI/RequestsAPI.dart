import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropDownStatusAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/RequestsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class GetAllRequestsapi {
  Requestscontroller c = Get.find<Requestscontroller>();
  BuildContext context;
  GetAllRequestsapi(this.context);
  Dio dio = Dio();

  GetAllRequests() async {
    try {
      c.restor();
      AllStatusModel statusModel =
          await Dropdownstatusapi(context).Dropdownstatus();
      c.setAllStatus(statusModel);
      String myurl = "${global.hostPort}${global.getRequests}";
      var response = await dio.get(myurl, data: {}, options: getDioOptions());
      if (response.statusCode == 200) {
        AllRequestsModel requests = AllRequestsModel.fromJson(response.data);
        c.setAllRequests(requests);
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
