import 'package:get/get_core/src/get_main.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/Files_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_File_API {
  Dio dio = Dio();
  Files_Controller controller = Get.find<Files_Controller>();

  Add_File({
    int? curriculumId,
    name,
    file,
    required bool hidden,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      FormData formData = FormData.fromMap({
        'name': '$name',
        'curriculumId': Get.find<Curriculumn_LMS_Controller>()
            .curriculum![curriculumId!]
            .id,
        'hidden': hidden ? 1 : 0,
        'classId': Get.find<Selected_Class_Controller>().classid
      });

      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(file, filename: "Division_File.pdf"),
        ));
      }

      String myurl = "$hostPort$addLmsCurriculmFile";

      var response = await dio.post(
          data: formData,
          cancelToken: cancelToken,
          myurl,
          options: getDioOptions());

      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        LMS_Files_Model lms_files_model =
            LMS_Files_Model.fromJson(response.data);
        controller.SetFiles(lms_files_model);
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
