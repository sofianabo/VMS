import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Deleteattendenceteacherapi {
  static Dio dio = Dio();

  static Future<dynamic> Deleteattendenceteacher(
      {required String employeeID, required String date}) async {
    String myURI = "$hostPort$deleteEmployeeAttendance";
    CancelToken cancelToken = CancelToken();
    try {
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'employeeId': employeeID, 'date': date},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Getteacherattendenceapi().Getteacherattendence(
            date: Get.find<Allteacheratendencecontroller>()
                .selectDateindex
                .toString());

        return response.statusCode;
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
    return true;
  }
}
