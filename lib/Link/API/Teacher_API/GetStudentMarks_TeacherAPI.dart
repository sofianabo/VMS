import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/QuizType_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Marks_Model.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class GetstudentmarksTeacherapi {
  GetstudentmarksTeacherapi();

  Dio dio = Dio();

  Future<void> GetstudentmarksTeacher({
    required int SemsterId,
    required int ClassId,
    required int DivisionId,
    required int CurrId,
  }) async {
    try {
      final controller = Get.find<StudentmarksTeachercontroller>();
      String myurl = "$hostPort$getStudentMarks";
      controller.setIsLoading(true);
      var response = await dio.post(
        data: {
          "divisionId": DivisionId,
          "curriculumId": CurrId,
          "classId": ClassId,
          "semesterId": SemsterId
        },
        myurl,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Students_Marks_Model students_marks_model =
            Students_Marks_Model.fromJson(response.data);
        controller.setStudentsMarksData(students_marks_model);
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
