import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Quiz_Type_For_Operation_Model.dart';

class Get_Quiz_Type_For_Opiration_API {
  Get_Quiz_Type_For_Opiration_API();

  Dio dio = Dio();

  Future<void> Get_Quiz_Type_For_Opiration({
    required String ClassId,
  }) async {
    try {
      String myurl = "$hostPort$getQuizTypeIdesAndName";
      TeachernoteAndGradeReco controller = Get.find();
      controller.SetIsQuizType_For_Opiration(true);

      var response = await dio.post(
        data: {
          "classId": ClassId,
        },
        myurl,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Quiz_Type_For_Operation_Model quiz_type_for_operation_model =
            Quiz_Type_For_Operation_Model.fromJson(response.data);
        controller.SetIsQuizType_For_OpirationData(
            quiz_type_for_operation_model);
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
  }
}
