import 'package:dio/dio.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Update_Students_Illness_API {
  Update_Students_Illness_API();
  Dio dio = Dio();
  Update_Students_Illness({id, List<Map<String, dynamic>>? illness}) async {
    String myurl = "$hostPort$updateStudentIll";
    try {
      FormData formData = FormData.fromMap({
        "id": id,
        "illnesses": (illness != null && illness.isNotEmpty)
            ? illness.map((item) {
                return {
                  "id": item["id"],
                  "file": item["file"],
                  "fileid": item["fileid"],
                };
              }).toList()
            : null,
      });

      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myurl,
          cancelToken: cancelToken, data: formData, options: getDioOptions());

      if (response.statusCode == 200) {
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      gets.Get.back();
      gets.Get.back();
      return response.statusCode;
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
