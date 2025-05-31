import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Update_Quiz_Type_API {
  Update_Quiz_Type_API();

  Dio dio = Dio();

  Future<void> Update_Quiz_Type({
    required int SemsterId,
    required int ClassId,
    required RxList<Map<String, dynamic>> groups, // تم تغيير نوع المصفوفة هنا
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      List<Map<String, dynamic>> objectData = groups.map((group) {
        return {
          "name": group["name"],
          "id": group["id"],
          "ratio": group["ratio"],
          "size": group["size"],
          "items": group["items"] != null
              ? group["items"].map((item) {
                  if (item["isQuizable"] != null) {
                    item["isQuizable"] = item["isQuizable"];
                  }
                  return item;
                }).toList()
              : [],
          "selectedForSum": (group["selectedForSum"] as List?)?.toList() ?? [],
        };
      }).toList();

      String myurl = "$hostPort$updateQuizType";
      var requestData = {
        "semesterId": SemsterId,
        "classId": ClassId,
        "object": objectData,
      };

      var response = await dio.post(
        myurl,
        data: requestData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
      } else if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      Get.back();
    }
  }
}
