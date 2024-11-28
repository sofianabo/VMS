import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/One_Employee_Model.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Edit_Employee.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

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
        One_Employee_Model one_employee_model = One_Employee_Model.fromJson(response.data);
        controller.setOneEmployee(one_employee_model);
        Get.back();
        EditEmployee(context, index,employeeID);
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
    }
    return true;
  }
}
