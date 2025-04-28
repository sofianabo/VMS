import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/view/Guardian/Functions/VirifingCode.dart';

class Enroll_API {
  Dio dio = Dio();
  Enroll_Now(
      {required String name,
      required String email,
      required String nationalid,
      required String phone,
      required String username,
      required String password}) async {
    var controller = Get.find<EnrollController>();
    String myurl = "${hostPort}${enroll}";
    try {
      controller.SetIsloading(true);
      CancelToken cancelToken = CancelToken();
      var response = await dio.post(myurl,
          cancelToken: cancelToken,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "email": email,
            "userName": username,
            "password": password
          },
          options: getDioOptions());

      if (response.statusCode == 200) {
        controller.SetIsloading(false);
        Get.dialog(
            barrierDismissible: false,
            GuaVerifingDialog(
              email: email,
              data: response.data['enroll_token'],
            ));
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 412) {
        controller.updateFieldError("username", true);
        ErrorMessage("اسم المستخدم مستخدم مسبقا");
        controller.SetIsloading(false);
      }
      if (e is DioException &&
          e.response?.statusCode == 400 &&
          e.response!.data['message']
              .contains("studentinfo_mobilenumber_unique")) {
        controller.SetIsloading(false);
        controller.updateFieldError("phone", true);
        await Future.delayed(Duration(milliseconds: 100));
        ErrorMessage("رقم الهاتف مستخدم مسبقا");
      } else if (e is DioException) {
        controller.SetIsloading(false);

        ErrorHandler.handleDioError(e);
      } else {
        controller.SetIsloading(false);

        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
