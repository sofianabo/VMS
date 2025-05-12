import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/RequestsModel.dart';
import 'package:vms_school/Link/Model/Guardian_Model/Guardian_MyData_Model.dart';

import '../../Controller/GuardianController/Guardian_My_Data_Controller.dart';
import '../Error_API.dart';

class Update_My_Data_API {
  Dio dio = Dio();
  Update_My_Data({
    required String full,
    required String National,
    required String Phone,
  }) async {
    String myURI = "$hostPort$updateGuardian";
    try {
      var controller = Get.find<Guardian_My_Data_Controller>();
      controller.SetIsLoading(true);
      var response = await dio.post(data: {
        "name": full,
        "nationalId": National,
        "phone": Phone,
      }, myURI, options: getDioOptions());
      if (response.statusCode == 200) {
        Guardian_MyData_Model guardianMyData =
            Guardian_MyData_Model.fromJson(response.data);
        controller.setGuardianMyData(guardianMyData);
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
    }
  }
}
