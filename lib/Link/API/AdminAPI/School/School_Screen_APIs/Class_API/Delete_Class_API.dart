import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Delete_Class_API {
  BuildContext context;
  Delete_Class_API(this.context);
  Dio dio = Dio();

  Delete_Class({
    index,
    classId,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$deleteClass";

      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {"classId": classId},
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get_All_Classes_API(context).Get_All_Classes(
            sessionID: Get.find<All_Screen_Sessions_Controller>().sessionId);
        Get.back();
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
