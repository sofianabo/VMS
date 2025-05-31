import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

import '../Error_API.dart';

class Update_Password_API {
  Dio dio = Dio();
  Update_Password({
    required String oldPass,
    required String newPass,
  }) async {
    String myURI = "$hostPort$updatePassword";
    CancelToken cancelToken = CancelToken();
    try {
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(
          cancelToken: cancelToken,
          data: {
            "password": oldPass,
            "newPassword": newPass,
          },
          myURI,
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
      if (e.toString().contains("status code of 401")) {
        Get.find<EnrollController>().updateFieldError("oldpassword", true);
        Get.back();

        ErrorMessage(
            "كلمة السر القديمة غير صحيحة يرجى التحقق منها ثم اعادة المحاولة");

        return;
      }
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
