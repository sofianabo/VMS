import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MultiChoiseModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Choose_The_Correct_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_Multi_Choise_Api {
  Dio dio = Dio();

  Add_Multi_Choise({
    required String Question,
    required List<String> answer,
    required List<int> trueIndexes, // تعديل لدعم أكثر من إجابة صحيحة
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      var controller = Get.find<Multi_Choise_Question_Controller>();
      String myurl = "$hostPort$addQuestion";

      var response = await dio.post(data: {
        'classId': Get.find<Selected_Class_Controller>().classid,
        'currId': Get.find<Qustions_Bank_Controller>().id,
        "type": "MultiChoice", // تغيير نوع السؤال
        "answer": answer,
        "trueIndex": trueIndexes, // إرسال مصفوفة الإجابات الصحيحة
        "description": Question
      }, cancelToken: cancelToken, myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        MultiChoiseModel chooes_the_correct_model =
            MultiChoiseModel.fromJson(response.data);
        controller.Add_Question(chooes_the_correct_model.question![0]);
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
