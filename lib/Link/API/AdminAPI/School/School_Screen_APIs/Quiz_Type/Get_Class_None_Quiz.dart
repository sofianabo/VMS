import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Get_None_Class {
  BuildContext context;
  Get_None_Class(this.context);
  static Get_None_Class_API({required int semesterId}) async {
    try {
      Dio dio = Dio();

      final quiz = Get.find<TeachernoteAndGradeReco>();

      quiz.SetisClassDialogLoading(true);

      String myurl = "${hostPort}${getNoneQuizTypeClass}";
      var response = await dio.post(
        myurl,
        options: getDioOptions(),
        data: {
          "semesterId": semesterId,
        },
      );
      if (response.statusCode == 200) {
        AllClassModel classes = AllClassModel.fromJson(response.data);
        Get.find<TeachernoteAndGradeReco>().SetNoneClass(classes);

        return classes;
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
