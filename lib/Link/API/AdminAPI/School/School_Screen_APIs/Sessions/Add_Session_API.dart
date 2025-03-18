import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Session_API {
  BuildContext context;
  Add_Session_API(this.context);
  Dio dio = Dio();

  Add_Session(
    String year,
    String startDate,
    String endDate,
  ) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$addSession";
      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {
            'year': year,
            'startDate': startDate,
            'endDate': endDate,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get_Session_Screen_API(context).Getsession();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e.toString().contains("status code of 409")) {
        print('object');

        Get.find<SessionController>().updateFieldError("start", true);
        Get.snackbar(
          "خطأ",
          "لا يسمح باضافة تاريخ بدء لانه يوجد سنة مفتوحة ضمن النطاق المحدد",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      Get.back();
    }
  }
}
