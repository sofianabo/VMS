import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class deleteStudentPenalty_API {
  deleteStudentPenalty_API();
  Dio dio = Dio();
  deleteStudentPenalty_AP({
    required int penaltyId,
    required int index,
  }) async {
    String myurl = "$hostPort$deleteStudentPenalty";
    try {
      var controller = Get.find<Penaltiesandrewardscontroller>();
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: {
            "id": penaltyId,
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        controller.removeidx(index);
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
    } finally {
      Get.back();
      Get.back();
    }
  }
}
