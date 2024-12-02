import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Edit_Grade_API {
  BuildContext context;
  Edit_Grade_API(this.context);
  Dio dio = Dio();

  Edit_Grade(

  {
    index,
    name,
    gradeId,
    enName,
    feeCount
}

      ) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      final controller = Get.find<Grade_Controller>();
      String myurl = "${hostPort}${updateGrade}";
      var response = await dio.post(
        cancelToken: cancelToken,
          myurl,
             data: {
             'gradeId':'$gradeId',
             'name':'$name',
             'enName':'$enName',
             'feeCount':'$feeCount',
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        controller.UpdateGrade(
          index,
          name.text,
          enName.text,
          feeCount.text,
        );
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }finally{
     Get.back();
    }
  }
}
