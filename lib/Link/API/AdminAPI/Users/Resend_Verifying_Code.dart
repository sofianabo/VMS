import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Resend_Verifying_Code_API {
  Resend_Verifying_Code_API();
  Dio dio = Dio();
  Resend_Verifying_Code() async {
    String myURI = "$hostPort$resendCode";
    try {
      var response = await dio.get(myURI, options: getDioOptions());
      if (response.statusCode == 200) {
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {}
  }
}
