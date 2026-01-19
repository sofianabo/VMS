import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Models/All_Jalaas_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_Jalaa_Settings_API {
  Add_Jalaa_Settings_API();
  Dio dio = Dio();
  Add_Jalaa_Settings({required String first,required String second}) async {
    final controller = Get.find<Jalaa_Page_Controller>();
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$addJalaaSetting";
      var response = await dio.post(
          cancelToken: cancelToken,
          data: {
            "jalaaSettings": {
              "shId": controller.templeteId,
              "mainCurriculum": controller.getPrimaryIds(),
              "downCurriculum": controller.getSecondaryIds(),
              "quizTypes": controller.getSemester(),
              "classId": controller.Classid,
              "Molahdat": {
                "firstSemester": first,
                "secondSemester": second,
                "manager": ""
              }
            }
          },
          myurl,
          options: getDioOptions());
      if (response.statusCode == 200) {
        All_Jalaas_Model allModel = All_Jalaas_Model.fromJson(response.data);
        Get.back();
        Get.back();
        // أضف كل عنصر داخل القائمة إلى الكونترولر
        for (var jalaa in allModel.jalaaSettings ?? []) {
          controller.addJalaa(jalaa);
        }
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
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
