import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/Link/Controller/AdminController/RequestsController.dart';
import 'package:getx/Link/Model/AdminModel/RequestsModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class GetAllRequestsapi {
  Requestscontroller c = Get.find<Requestscontroller>();
  BuildContext context;
  GetAllRequestsapi(this.context);
  Dio dio = Dio();

  GetAllRequests() async {
    try {
      String myurl = "${global.hostPort}${global.getRequests}";
      var response = await dio.get(myurl,
          data: {},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
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
