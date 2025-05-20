import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Country_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';

class Get_Country_API {
  Dio dio = Dio();
  Get_Country() async {
    String myURI = "$hostPort$getCountry";
    try {
      final controller = Get.find<SchoolInfoController>();
      controller.setCountryIsLoading(true);
      var response = await dio.get(myURI, options: getDioOptions());
      if (response.statusCode == 200) {
        Country_Model country_model = Country_Model.fromJson(response.data);
        controller.setCountryData(country_model.country);
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
