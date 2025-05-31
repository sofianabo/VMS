import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_All_Peanlitys_API {
  final Penaltiesandrewardscontroller c =
      Get.find<Penaltiesandrewardscontroller>();
  Dio dio = Dio();

  Get_All_Peanlitys(int id) async {
    try {
      CancelToken cancelToken = CancelToken();
      String myurl = "$hostPort$getStudentsPenalty";
      var response = await dio.post(myurl,
          cancelToken: cancelToken, data: {"id": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        return PenaltiesStudentModel.fromJson(response.data);
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
