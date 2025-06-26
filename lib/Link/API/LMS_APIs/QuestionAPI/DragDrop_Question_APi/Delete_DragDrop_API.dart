import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

import '../../../../Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';

class Delete_Dragdrop_Api {
  Delete_Dragdrop_Api();
  Dio dio = Dio();
  DragDrop_Question_Controller controller = Get.find<DragDrop_Question_Controller>();

  Delete_Dragdrop({
    required Question question,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      String myurl = "$hostPort$deleteQuestion";

      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          data: {
            "id": question.id,
            'classId': Get.find<Selected_Class_Controller>().classid,
            'currId': Get.find<Qustions_Bank_Controller>().id
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        controller.deleteQuestion(question);
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
