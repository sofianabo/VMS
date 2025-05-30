import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Re_Password_API {
  Dio dio = Dio();
  Re_Password(
      {required String oldPassword, required String newPassword}) async {
    String myURI = "$hostPort$updatePassword";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myURI,
          data: {
            "password": oldPassword,
            "newPassword": newPassword,
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        Get.back();
        Get.find<Admin_Profile_Content>().ChangeenabledPasswordInfo(false);
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
        if (e.response!.data['message'] == "wrong password") {
          Get.back();
          ErrorMessage(
              "Your password is not true , Please cheek your password and try again later"
                  .tr);
        }
      }
    }
  }
}
