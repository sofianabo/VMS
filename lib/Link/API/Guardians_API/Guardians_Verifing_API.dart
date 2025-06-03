import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/main.dart';

class Verify_Gua_API {
  Dio dio = Dio();
  Verify_Account({
    required String email,
    required String code,
    required String enroll_token,
  }) async {
    String myURI = "$hostPort$verifyCodeAndEnroll";

    try {
      var response = await dio.post(
        myURI,
        data: {
          "code": code,
          "enroll_token": enroll_token,
        },
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        prefs!.setBool("isLogin", true);
        prefs!.setBool("isLogin", true);
        prefs!.setString("role", response.data['roll']);
        prefs!.setString("token", response.data['token']);
        prefs!.setBool("isVerified", response.data['verified']);
        prefs!.setString("fullname", response.data['fullName']);
        prefs!.setString("email", email);
        Get.offAllNamed('/guardian');
        print("im here");
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      return null;
    }
  }
}
