import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Export_Sames_Jalaa.dart';

class Preview_Jalaa_Settings_API {
  Preview_Jalaa_Settings_API();
  Dio dio = Dio();
  Preview_Jalaa_Settings({id}) async {
    final controller = Get.find<Jalaa_Controller>();
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$exportJalaa";
      var response = await dio.post(
          cancelToken: cancelToken,
          data: {"id": id},
          myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        debugPrint("RESPONSE DATA: ${response.data}", wrapWidth: 1024);

        // إذا كانت data عبارة عن Map بالفعل، فلا حاجة لـ jsonDecode
        if (response.data is Map<String, dynamic>) {
          final rebortJson = response.data['rebort'];

          if (rebortJson != null) {
            final rebort = Rebort.fromJson(rebortJson);
            controller.setRebort(rebort);

            Get.back();
            Get.to(ExportSamesJalaa());
          } else {
            print("مفتاح rebort غير موجود أو null في JSON.");
          }
        } else {
          print("response.data ليس Map. نوعه: ${response.data.runtimeType}");
        }
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
