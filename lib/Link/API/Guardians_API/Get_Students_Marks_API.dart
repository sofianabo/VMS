import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/GuardianController/Students_Marks_Gua_Controller.dart';
import 'package:vms_school/Link/Model/Guardian_Model/Students_Marks_Gua_Model.dart';
import 'package:vms_school/view/Guardian/My_Students_Marks/Students_Marks_Grid.dart';

class Get_Students_Marks_API_Gua {
  Dio dio = Dio();
  Get_Students_Marks({required StudentsID}) async {
    String myURI = "${hostPort}${getStudentMarksById}";
    try {
      final controller = Get.find<Students_Marks_Gua_Controller>();
      controller.SetIsLoading(true);
      CancelToken cancelToken = CancelToken();
      var response = await dio.post(
          cancelToken: cancelToken,
          myURI,
          data: {"studentId": StudentsID, "sessionId": 1},
          options: getDioOptions());
      if (response.statusCode == 200) {
        StudentsMarksModel student_info_model =
            StudentsMarksModel.fromJson(response.data);
        controller.SetDataFromAPI(student_info_model);

        Get.to(GradesScreen());
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
