import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../API.dart' as global;

class Schooltimetableapi {
  final AdminSchoolTimeController c = Get.find<AdminSchoolTimeController>();
  BuildContext context;

  Schooltimetableapi(this.context);
  Dropdowndivisioncontroller d = Get.find<Dropdowndivisioncontroller>();
  Dio dio = Dio();

  Schooltimetable(int? id) async {
    try {
      c.setIsLoading(true);
      AllClassModel cl = await Getallclassapi.getAllClasses();

      c.setAllClasses(cl);

      int? idx = id == -1 || id == null ? null : d.allDivision[id!].id;
      String myurl = "${global.hostPort}${global.getDivisionStudyShare}";
      var response = await dio.post(myurl,
          data: {"divisionId": idx}, options: getDioOptions());
      if (response.statusCode == 200) {
        SchoolTimeModel model = SchoolTimeModel.fromJson(response.data);

        c.setStudyShare(model);
        for (int i = 0; i < model.studyShare!.length; i++) {
          tableData[days[model.studyShare![i].day]!]
                  [lessions[model.studyShare![i].lessonId]!] =
              model.studyShare![i].toString();
        }
        m = model;

        print(m!.studyShare);
        Get.back();
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
