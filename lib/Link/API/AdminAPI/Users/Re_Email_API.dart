import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Re_Verifing_Code_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Re_Email_API {
  Re_Email_API();
  Dio dio = Dio();
  Re_Email(
      {required String email,
      required String password,
      required bool showdiag}) async {
    String myURI = "$hostPort$updateEmail";
    try {
      CancelToken cancelToken = CancelToken();
      if (showdiag) {
        Loading_Dialog(cancelToken: cancelToken);
      }
      var response = await dio.post(
          cancelToken: cancelToken,
          data: {
            "email": email,
            "password": password,
          },
          myURI,
          options: getDioOptions());
      if (response.statusCode == 200) {
        if (showdiag) {
          Get.back();
          Get.dialog(Re_VerifingCodeDialog(
            email: email,
            password: password,
          ));
        }
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
        if (e.response!.data['message'] == "wrong password") {
          Get.back();
          ErrorMessage(
              "Your password is not true , Please cheek your password and try again later"
                  .tr);
        }
      }
    }
  }
}
