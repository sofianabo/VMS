import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import '../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Deleterequestchildapi {
  Deleterequestchildapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deleterequestchild({required String id}) async {
    String myurl = "${global.hostPort}${global.deleteStudent}/$id";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.delete(
          cancelToken: cancelToken, myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        await Get_My_Children_API().Get_My_Children();
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
    } finally {}
  }
}
