import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/PenaltyController.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Deletepenaltyapi {
  BuildContext context;
  Deletepenaltyapi(this.context);
  Dio dio = Dio();

  Deletepenalty({
    index,
    penaltyId,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      final controller = Get.find<Penaltycontroller>();
      String myurl = "$hostPort$deletePenalty/$penaltyId";

      var response = await dio.delete(
          cancelToken: cancelToken, myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        controller.DeletePenalty(index);
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
      Get.back();
    }
  }
}
