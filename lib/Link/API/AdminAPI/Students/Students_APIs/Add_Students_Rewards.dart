import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';

class Add_Students_Rewards_API {
  Dio dio = Dio();

  Add_Students_Rewards({
    required String name,
    required int StudentId,
    required file,
  }) async {
    String myURI = "$hostPort$addStudentPrize";
    try {
      // إنشاء token للإلغاء
      CancelToken cancelToken = CancelToken();

      // تحقق من البيانات المرسلة (الملف)
      if (file == null || file.isEmpty) {

        return;
      } else {

      }

      // إعداد البيانات المرسلة في الطلب
      Map<String, dynamic> formDataMap = {
        "name": name,
        "cause": "s",
        "studentId": StudentId,
      };

      // إضافة الملف إلى البيانات
      formDataMap["file"] = await MultipartFile.fromBytes(
        file, // بيانات الـ Uint8List
        filename: 'Student Rewards File.pdf', // اسم الملف
      );

      // إرسال الطلب
      var response = await dio.post(
        myURI,
        data: FormData.fromMap(formDataMap),
        options: getDioOptions(),
      );

      // تحقق من استجابة API
      if (response.statusCode == 200) {

      } else {

        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
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
