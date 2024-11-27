import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Editguardianapi {
  final Allgaurdiancontroller u = Get.find<Allgaurdiancontroller>();
  Editguardianapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Editguardian(int id, String name, String email, String nationalid,
      String phone, int index) async {
    String myurl = "${global.hostPort}${global.editGuardian}";
    try {
      var response = await dio.post(myurl,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "guardianId": id,
            "email":email
          },
options: getDioOptions());
      if (response.statusCode == 200) {
        u.updateGuardian(name, index, phone, email, nationalid);
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
