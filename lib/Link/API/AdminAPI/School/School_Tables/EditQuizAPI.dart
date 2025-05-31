import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';

import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import '../../../API.dart' as global;

class Editquizapi {
  ExamTableController u = Get.find<ExamTableController>();

  Editquizapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Editquiz(
    String id,
    String startDate,
    String period,
    String maxMark,
    String PassingMark,
  ) async {
    String myurl = "${global.hostPort}${global.updateQuiz}";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "id": id,
            "startDate": startDate,
            "period": period,
            "maxMark": maxMark,
            "PassingMark": PassingMark,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        await Examtableapi(context).Examtable();
        Get.back();
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
