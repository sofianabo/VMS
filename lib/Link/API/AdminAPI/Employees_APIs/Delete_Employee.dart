import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class DeleteEmployee {
  static Dio dio = Dio();

  static Future<dynamic> DeleteEmployeeByID({
    required String employeeID,
  }) async {
    String myURI = "${hostPort}${deleteEmployee}";
    try {
      var response = await dio.post(
        myURI,
        data: {
          'id':employeeID
        },
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Get.back();
        return response.statusCode;
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
    }
    return true;
  }

}
