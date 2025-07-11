import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Edit_Session_API {
  BuildContext context;
  Edit_Session_API(this.context);
  Dio dio = Dio(); 

  Edit_Session({
    year,
    startDate,
    endDate,
    sessionId,
    String? firstStart,
    String? firstEnd,
    String? secondStart,
    String? secondEnd,
    String? firstDays,
    String? secondDays,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$updateSession";
      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {
            'year': '$year',
            'sessionId': '$sessionId',
            'startDate': '$startDate',
            'endDate': '$endDate',
             'firstSemesterStart': firstStart,
        'firstSemesterEnd': firstEnd,
        'secondSemesterStart': secondStart,
        'secondSemesterEnd': secondEnd,
        'firstSemesterCount': firstDays,
        'secondSemesterCount': secondDays,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get_Session_Screen_API().Getsession();
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
    } finally {
      Get.back();
    }
  }
}
