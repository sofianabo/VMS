import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Deletestudentattendenceapi {
  static Dio dio = Dio();

  static Future<dynamic> Deletestudentattendence(
      {required String ID, required String date}) async {
    String myURI = "$hostPort$deleteStudentAttendance";
    CancelToken cancelToken = CancelToken();
    try {
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'studentId': ID, 'date': date},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Studentattendenceapi().Studentattendence(
            date: Get.find<StudentAttendencController>()
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
