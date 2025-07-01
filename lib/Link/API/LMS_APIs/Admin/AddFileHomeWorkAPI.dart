import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeWorkLMSModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Addfilehomeworkapi {
  BuildContext context;
  Addfilehomeworkapi(this.context);
  Dio dio = Dio();
  Curriculumn_LMS_Controller controller =
      Get.find<Curriculumn_LMS_Controller>();
        final homeCont = Get.find<Homeworkcontroller>();


  Addfilehomework({
    divisionId,
    int? curriculumId,
    name,
    file,
    endDate,
    mark,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      int? currid = controller.curriculum![curriculumId!].id;

      FormData formData = FormData.fromMap({
        'name': '$name',
        'lastDate': '$endDate',
        'divisionId': '$divisionId',
        'curriculumId': currid,
        'mark': '$mark'
      });

      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(file, filename: "HomeWork.pdf"),
        ));
      }

      String myurl = "$hostPort$addHomework";

      var response = await dio.post(
          data: formData,
          cancelToken: cancelToken,
          myurl,
          options: getDioOptions());

      if (response.statusCode == 200) { 
        gets.Get.back();
        gets.Get.back();
                HomeworkLMSModel homeworkLMSModel =
            HomeworkLMSModel.fromJson(response.data);
        homeCont.Add_Homework(homeworkLMSModel.homeworke![0]);
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
