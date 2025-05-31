import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudyShareTeacherController.dart';
import 'package:vms_school/Link/Model/Teacher_Model/StudyShareTeacherModel.dart';

import 'package:vms_school/view/SMS_Platform/Teacher/Functions/StudyshareTeacher.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import '../API.dart' as global;

class Studyshareteacherapi {
  final Studyshareteachercontroller c = Get.find<Studyshareteachercontroller>();
  BuildContext context;

  Studyshareteacherapi(this.context);
  Dio dio = Dio();

  Studyshareteacher() async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      c.setIsLoading(true);

      String myurl = "${global.hostPort}${global.getMyStudyShare}";

      var response = await dio.post(myurl,
          cancelToken: cancelToken, data: {}, options: getDioOptions());
      if (response.statusCode == 200) {
        StudyShareTeacherModel model =
            StudyShareTeacherModel.fromJson(response.data);

        c.setStudyShare(model);
        for (int i = 0; i < 5; i++)
          for (int j = 1; j < 8; j++) {
            String s = "No Lesson";
            for (int k = 0; k < j; k++) s += " ";
            tableDataTeacherMorning[i][lessionsTeacherMorning[j]!] = s;
            tableDataTeacherEvening[i][lessionsTeacherEvening[j]!] = s;
          }
        for (int i = 0;
            i < model.studySharee!.studyShareTecherMorning!.length;
            i++) {
          indexesTeacherMorning![PairTeacherMorning(
                  daysTeacherMorning[
                      model.studySharee!.studyShareTecherMorning![i].day]!,
                  model.studySharee!.studyShareTecherMorning![i].lessonId!)] =
              model.studySharee!.studyShareTecherMorning![i].id!;
          tableDataTeacherMorning[daysTeacherMorning[
                      model.studySharee!.studyShareTecherMorning![i].day]!][
                  lessionsTeacherMorning[model
                      .studySharee!.studyShareTecherMorning![i].lessonId]!] =
              model.studySharee!.studyShareTecherMorning![i].toString();
        }

        for (int i = 0;
            i < model.studySharee!.studyShareTecherEvening!.length;
            i++) {
          indexesTeacherEvening![PairTeacherEvening(
                  daysTeacherEvening[
                      model.studySharee!.studyShareTecherEvening![i].day]!,
                  model.studySharee!.studyShareTecherEvening![i].lessonId!)] =
              model.studySharee!.studyShareTecherEvening![i].id!;
          tableDataTeacherEvening[daysTeacherEvening[
                      model.studySharee!.studyShareTecherEvening![i].day]!][
                  lessionsTeacherEvening[model
                      .studySharee!.studyShareTecherEvening![i].lessonId]!] =
              model.studySharee!.studyShareTecherEvening![i].toString();
        }
        Get.back();

        modTeacher = model;

        return model;
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
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
