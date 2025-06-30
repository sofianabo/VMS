import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/GetAllQuizLmsAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';

import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import '../../API.dart' as global;

class Edit_Quiz_Lms_Api {
  Allquizcontroller u = Get.find<Allquizcontroller>();

  Edit_Quiz_Lms_Api(this.context);
  BuildContext context;
  Dio dio = Dio();
  Edit_Quiz_Lms({
    int? id,
    String? startDate,
    String? period,
    int? maxMark,
    int? PassingMark,
    String? name,
    int? hidden,
    QuizLms? quiz,
  }) async {
    String myurl = "${global.hostPort}${global.updateLmsQuiz}";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          data: {
            "id": id,
            "name": name,
            "startDate": startDate,
            "period": period,
            "maxMark": maxMark,
            "PassingMark": PassingMark,
            "hidden": hidden
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        print(startDate);
        QuizLms updatedQuiz = QuizLms(
            id: id,
            name: name,
            startDate: startDate,
            period: period,
            maxMark: maxMark,
            passingMark: PassingMark,
            hidden: hidden,
            curriculumEnName: quiz!.curriculumEnName,
            curriculumName: quiz.curriculumName
            // أضف باقي الحقول إذا كانت موجودة
            );
        // استخدم indexWhere مع id للعثور على الموضع الصحيح
        int index = u.quizLMS!.indexWhere((item) => item.id == id);
        if (index != -1) {
          // استخدم البيانات المرجعة من الـ API مباشرة
          // AllQuizLmsModel quesModel =
          //     await AllQuizLmsModel.fromJson(response.data);
          u.Update_Quiz(updatedQuiz, index);
          // أول عنصر في القائمة المرجعة
        } else {
          print("Element not found in quizLMS list");
        }
        Get.back();
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
