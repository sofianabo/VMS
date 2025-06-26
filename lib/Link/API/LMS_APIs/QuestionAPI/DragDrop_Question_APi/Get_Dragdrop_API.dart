import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_DragDrop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';

class Get_Dragdrop_Api {
  Dio dio = Dio();
  Get_Dragdrop() async {
    final controller = Get.find<DragDrop_Question_Controller>();
    final CTC_controller = Get.find<Quiz_DragDrop_Question_Controller>();
    controller.SetIsLoading(true);
    CTC_controller.SetIsLoading(true);
    try {
      String myurl = "$hostPort$getQuestion";

      var response = await dio.post(myurl,
          data: {
            'classId': Get.find<Selected_Class_Controller>().classid,
            'currId': Get.find<Qustions_Bank_Controller>().id,
            "type": "DragDrop"
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        controller.filterName = "";
        CTC_controller.filterName = "";
        DragDrop_Question_Model dragDrop_Model =
            DragDrop_Question_Model.fromJson(response.data);
        controller.setQuestion(dragDrop_Model);
        CTC_controller.setQuestion(dragDrop_Model);
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
