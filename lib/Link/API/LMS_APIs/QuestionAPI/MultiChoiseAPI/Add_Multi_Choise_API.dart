import 'dart:typed_data';

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
    required List<int> trueIndexes,
        Uint8List? Image,
 // تعديل لدعم أكثر من إجابة صحيحة
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {

        FormData formData = FormData();

      formData.fields.addAll([
        MapEntry( 'classId', Get.find<Selected_Class_Controller>().classid.toString(),),
        MapEntry(        'currId', Get.find<Qustions_Bank_Controller>().id.toString(),
),
        MapEntry("type", "MultiChoice"),
    
        MapEntry( "trueIndex", trueIndexes.toList().toString(),),
        MapEntry(
           "description", Question
        ),
      ]);
       for (int i = 0; i < answer.length; i++) {
        formData.fields
            .add(MapEntry('answer[$i]', answer[i].toString()));
      }
       for (int i = 0; i < trueIndexes.length; i++) {
        formData.fields
            .add(MapEntry('trueIndex[$i]', trueIndexes[i].toString()));
      }
        if (Image != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(Image, filename: "Image.jpg"),
        ));
      }

      var controller = Get.find<Multi_Choise_Question_Controller>();
      String myurl = "$hostPort$addQuestion";

      var response = await dio.post(data: formData, cancelToken: cancelToken, myurl, options: getDioOptions());

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
