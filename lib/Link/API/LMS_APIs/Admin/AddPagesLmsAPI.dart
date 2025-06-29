import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetAllLinksLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/PagesLmsController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/LinksLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/PagesLmsModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Addpageslmsapi {
  BuildContext context;
  Addpageslmsapi(this.context);
  Dio dio = Dio();
  Curriculumn_LMS_Controller controller =
      Get.find<Curriculumn_LMS_Controller>();
  Pageslmscontroller linkcontrol = Get.find<Pageslmscontroller>();

  Addpageslms({int? curriculumId, name, link, required bool hidden}) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      int? currid = controller.curriculum![curriculumId!].id;

      String myurl = "$hostPort$addLmsCurriculmPage";

      var response = await dio.post(data: {
        'name': '$name',
        'page': '$link',
        'classId': Get.find<Selected_Class_Controller>().classid,
        'curriculumId': currid,
        'hidden': hidden ? 1 : 0,
      }, cancelToken: cancelToken, myurl, options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        PagesLmsModel lms_files_model = PagesLmsModel.fromJson(response.data);
        linkcontrol.SetPages(lms_files_model);
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
