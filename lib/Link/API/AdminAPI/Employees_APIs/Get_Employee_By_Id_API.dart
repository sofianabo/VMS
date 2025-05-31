import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/One_Employee_Model.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Employee_Manager/Edit_Employee.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class GetEmployeeByIdApi {
  static Dio dio = Dio();

  static Future<dynamic> GetEmployeeById({
    required String employeeID,
    required BuildContext context,
    required int index,
  }) async {
    final controller = Get.find<Allempolyeecontroller>();
    controller.SetDefualtValue();
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);

    String myURI = "$hostPort$getEmployeeById";

    try {
      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: {'employeeId': employeeID},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        One_Employee_Model oneEmployeeModel =
            One_Employee_Model.fromJson(response.data);
        controller.setOneEmployee(oneEmployeeModel);
        Get.back();
        Get.dialog(
          Edit_Employee(employeeID: employeeID),
          barrierDismissible: false,
        );

        return response.statusCode;
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
      } else if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
    return true;
  }
}
