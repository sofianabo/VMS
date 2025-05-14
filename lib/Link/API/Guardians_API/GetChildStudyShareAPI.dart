import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/view/Admin/School_Management/Tables/SchoolTimeTable.dart';
import 'package:vms_school/view/Guardian/Functions/StudyShareForChild.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../API.dart' as global;

class Getchildstudyshareapi {
  final AdminSchoolTimeController c = Get.find<AdminSchoolTimeController>();
  BuildContext context;

  Getchildstudyshareapi(this.context);
  Dio dio = Dio();

  Getchildstudyshare(int? id) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      c.setIsLoading(true);

      String myurl = "${global.hostPort}${global.getDivisionStudyShare}";

      var response = await dio.post(myurl,
      cancelToken: cancelToken,
          data: {"studentId": id}, options: getDioOptions());
      if (response.statusCode == 200) {
        SchoolTimeModel model = SchoolTimeModel.fromJson(response.data);

        c.setStudyShare(model);
        for (int i = 0; i < 5; i++)
          for (int j = 1; j < 8; j++) {
            String s = "No Lesson";
            for (int k = 0; k < j; k++) s += " ";
            tableDataChild[i][lessionsChild[j]!] = s;
          }
        for (int i = 0; i < model.studyShare!.length; i++) {
          indexesChild![Pairr(days[model.studyShare![i].day]!,
              model.studyShare![i].lessonId!)] = model.studyShare![i].id!;
          tableDataChild[daysChild[model.studyShare![i].day]!]
                  [lessionsChild[model.studyShare![i].lessonId]!] =
              model.studyShare![i].toString();
        }
        Get.back();

        mod = model;

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
