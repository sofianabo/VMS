import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import '../../Model/AdminModel/Students_Models/Students_Marks_Model.dart';

class AddstudentmarksTeacherapi {
  final Dio dio = Dio();

  Future<int?> saveSingleStudent({
    required int curriculumId,
    required Student student,
  }) async {
    return await _saveStudents(
      curriculumId: curriculumId,
      students: [student],
    );
  }

  Future<int?> saveAllStudents({
    required int curriculumId,
    required List<Student> students,
  }) async {
    return await _saveStudents(
      curriculumId: curriculumId,
      students: students,
    );
  }

  Future<int?> _saveStudents({
    required int curriculumId,
    required List<Student> students,
  }) async {
    String myURI = "$hostPort$addMarks";

    try {
      final cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      final studentsData = students.map((student) {
        return {
          "id": student.id,
          "fullName": student.fullName,
          "mark": student.mark?.map((mark) {
                return {
                  "id": mark.id,
                  "type": mark.type, // إضافة type حسب الموديل
                  "mark": mark.mark ?? 0,
                };
              }).toList() ??
              [],
        };
      }).toList();

      final response = await dio.post(
        myURI,
        data: {
          "curriculumId": curriculumId,
          "studentId": studentsData,
        },
        options: getDioOptions(),
        cancelToken: cancelToken,
      );

      if (response.statusCode == 200) {
        Get.back();
        return response.statusCode;
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
        return response.statusCode;
      }
    } on DioException catch (e) {
      ErrorHandler.handleDioError(e);
    } on Exception catch (e) {
      ErrorHandler.handleException(e);
    } finally {
      Get.back();
    }
    return null;
  }
}
