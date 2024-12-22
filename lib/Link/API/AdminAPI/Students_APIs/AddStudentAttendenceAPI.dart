import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Addstudentattendenceapi {
  static Dio dio = Dio();

  static Future<dynamic> Addstudentattendence({
    required students,
  }) async {

    final controller = Get.find<EmployeeController>();
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);

    try {
      String myURI = "$hostPort$addStudentAttendance";
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'attendance': students},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        controller.setIsIsuploaded(true);
        return response.statusCode;
      } else {

        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {

      if (e is DioError && e.type == DioErrorType.cancel) {
        print("Request canceled");
      } else if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }finally{
      Get.back();
    }
    return true;
  }
}
