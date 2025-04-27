import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolContentAPI/School_Content_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Edit_Content_API {
  BuildContext context;
  Edit_Content_API(this.context);
  Dio dio = Dio();

  Edit_Content({
    name,
    enName,
    id,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$updateSchoolContents";
      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {
            'id': '$id',
            "name": '$name',
            "enName": '$enName',
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();

        Get_Content_Screen_API(context).Get_Content_Screen();
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
