import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/GuardianController/ChildExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/Functions/ExamTableForChild.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Getchildexamtableapi {
  final BuildContext context;
  final Dio dio = Dio();

  Getchildexamtableapi(this.context);

  Future<void> Getchildexamtable(
      {int? studentId, required int? index_of_student}) async {
    final controller = Get.find<Childexamtablecontroller>();

    controller.setIsLoading(true);

    try {
      String apiUrl = "${hostPort}${getStudentQuiz}";
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      var response = await dio.post(
        apiUrl,
        data: {"studentId": studentId},
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      Get.back();
      if (response.statusCode == 200) {
        ExamTableModel examtablechildmodel =
            ExamTableModel.fromJson(response.data);
        controller.setAllQuiz(examtablechildmodel);
        Get.dialog(Examtableforchild(
            id: studentId.toString(), indexOfStudent: index_of_student));
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      controller.setIsLoading(false);
    }
  }
}
