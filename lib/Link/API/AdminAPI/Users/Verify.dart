import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/main.dart';

class Verify_Account_API {
  Verify_Account_API();
  Dio dio = Dio();

  Verify_Account({
    required String code,
    String? email,
  }) async {
    String myURI = "$hostPort$verify";

    Map<String, dynamic> data = {
      "verifyCode": code,
    };

    if (email != null) {
      data["email"] = email;
    }

    try {
      var response = await dio.post(
        myURI,
        data: data,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        prefs!.setBool("isVerified", true);
        if (email != null) {
          prefs!.setString("email", email);
        }
        Get.find<Admin_Profile_Content>().ChangeenabledEmailInfo(false);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {


      return null;
    }
  }
}
