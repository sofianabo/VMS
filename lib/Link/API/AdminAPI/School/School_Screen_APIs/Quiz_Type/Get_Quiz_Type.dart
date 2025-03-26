import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Get_Quiz_Type_API {
  Get_Quiz_Type_API();

  Dio dio = Dio();

  Future<void> Get_Quiz_Type({
    required int SemsterId,
    required String ClassId,
  }) async {
    try {
      String myurl = "$hostPort$getQuizType";
      TeachernoteAndGradeReco controller = Get.find();
      controller.SetIsQuizType(true);
      var response = await dio.post(
        data: {"classId": ClassId, "semesterId": SemsterId},
        myurl,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        var data = response.data["type"];
        controller.updateGroup(List<Map<String, dynamic>>.from(data));
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
    } finally {
      Get.back();
    }
  }
}
