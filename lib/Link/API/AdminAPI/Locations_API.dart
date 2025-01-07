import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Location_Model.dart';

class Get_Location_API {
  Get_Location_API(this.context);
  BuildContext context;

  static Get_Locations() async {
    Dio dio = Dio();
    String myURI = "${hostPort}${getLocation}";

    try {
      final controller = Get.find<Location_controller>();
      controller.setIsLoading(true);
      var response = await dio.get(myURI, options: getDioOptions());
      if (response.statusCode == 200) {
        Location_Model location_model = Location_Model.fromJson(response.data);
        controller.setLocations(location_model);
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
