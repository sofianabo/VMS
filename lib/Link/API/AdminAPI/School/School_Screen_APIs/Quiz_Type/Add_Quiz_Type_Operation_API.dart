import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Quiz_Type_Operation_API {
  Add_Quiz_Type_Operation_API();
  Dio dio = Dio();
  Add_Quiz_Type_Operation({
    required int quizTypeId,
    required String operationType,
    List<int>? ids,
  }) async {
    String myURI = "$hostPort$addQuizTypeOperation";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myURI,
          cancelToken: cancelToken,
          data: {
            'quizTypeId': quizTypeId,
            'operationType': operationType,
            'ids': ids,
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
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
    } finally {
      Get.back();
    }
  }
}
