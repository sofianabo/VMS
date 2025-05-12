import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/RequestsModel.dart';
import 'package:vms_school/Link/Model/Guardian_Model/Guardian_MyData_Model.dart';

import '../../Controller/GuardianController/Guardian_My_Data_Controller.dart';
import '../Error_API.dart';

class Get_My_Data_API {
  Dio dio = Dio();
  Get_My_Data() async {
    String myURI = "$hostPort$getMyData";
    try {
      var controller = Get.find<Guardian_My_Data_Controller>();
      var response = await dio.post(myURI, options: getDioOptions());
      controller.SetIsLoading(true);
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
