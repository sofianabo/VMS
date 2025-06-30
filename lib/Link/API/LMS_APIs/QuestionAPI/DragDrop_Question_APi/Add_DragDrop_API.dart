import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MultiChoiseModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Choose_The_Correct_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_Dragdrop_Api {
  final Dio dio = Dio();

  Future<bool> Add_Dragdrop({
    required String Question,
    required List<Map<String, dynamic>> questions,
    required List<Map<String, dynamic>> answers,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);

    try {
      final controller = Get.find<DragDrop_Question_Controller>();
      final String myurl = "$hostPort$addQuestion";

      // إنشاء FormData
      final formData = FormData();

      // إضافة الحقول الأساسية
      formData.fields.addAll([
        MapEntry('classId',
            Get.find<Selected_Class_Controller>().classid.toString() ?? ''),
        MapEntry('currId', Get.find<Qustions_Bank_Controller>().id ?? ''),
        MapEntry('type', 'DragDrop'),
        MapEntry('description', Question),
      ]);
      // إعداد الأسئلة مع ضمان إرسال جميع العناصر
      for (int i = 0; i < questions.length; i++) {
        final q = questions[i];

        // النص - إرساله دائماً حتى لو كان فارغاً
        formData.fields
            .add(MapEntry('question[$i][text]', q['text']?.toString() ?? ''));

        // الملف - معالجته بشكل منفصل
        if (q.containsKey('file') &&
            q['file'] != null &&
            q['file'].toString().isNotEmpty) {
          if (q['file'].toString().startsWith('data:image')) {
            final bytes = base64Decode(q['file'].toString().split(',').last);
            formData.files.add(MapEntry(
              'question[$i][file]',
              MultipartFile.fromBytes(bytes, filename: 'question_$i.jpg'),
            ));
          }
        } else {
          formData.fields.add(MapEntry('question[$i][file]', ''));
        }
      }

      // إعداد الإجابات مع ضمان إرسال جميع العناصر
      for (int i = 0; i < answers.length; i++) {
        final a = answers[i];

        // النص - إرساله دائماً حتى لو كان فارغاً
        formData.fields
            .add(MapEntry('answer[$i][text]', a['text']?.toString() ?? ''));

        // الملف - معالجته بشكل منفصل
        if (a.containsKey('file') &&
            a['file'] != null &&
            a['file'].toString().isNotEmpty) {
          if (a['file'].toString().startsWith('data:image')) {
            final bytes = base64Decode(a['file'].toString().split(',').last);
            formData.files.add(MapEntry(
              'answer[$i][file]',
              MultipartFile.fromBytes(bytes, filename: 'answer_$i.jpg'),
            ));
          }
        } else {
          formData.fields.add(MapEntry('answer[$i][file]', ''));
        }
      }

      final response = await dio.post(
        myurl,
        data: formData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        DragDrop_Question_Model DragDrop_Question =
            DragDrop_Question_Model.fromJson(response.data);
        // if (matchingModel.question != null && matchingModel.question!.isNotEmpty) {
        controller.addQuestion(DragDrop_Question.question![0]);
        Get.back();
        Get.back();

        // إغلاق dialog التحميل
        return true;

        // throw Exception("لا توجد بيانات مستلمة");
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      ErrorHandler.handleDioError(e);
      return false;
    } catch (e) {
      ErrorHandler.handleException(
          e is Exception ? e : Exception(e.toString()));
      return false;
    }
  }
}
