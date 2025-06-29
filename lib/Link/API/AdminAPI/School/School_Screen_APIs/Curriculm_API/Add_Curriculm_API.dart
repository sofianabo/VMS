import 'package:flutter/services.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_Curriculm_API {
  BuildContext context;
  Add_Curriculm_API(this.context);
  Dio dio = Dio();

  Add_Curriculm({
    subjectId, 
    semesterId,
    name,
    Ename,
    maxMark,
    PassingMark,
    type,
    Uint8List? file,
    Uint8List? Image,
  }) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      FormData formData = FormData();

      formData.fields.addAll([
        MapEntry('subjectId', subjectId.toString()),
        MapEntry('name', name),
        MapEntry('enName', Ename),
        MapEntry('maxMark', maxMark.toString()),
        MapEntry('PassingMark', PassingMark.toString()),
        MapEntry(
          'type',
          '${type == true ? 1 : 0}',
        ),
      ]);

      for (int i = 0; i < semesterId.length; i++) {
        formData.fields
            .add(MapEntry('semesterId[$i]', semesterId[i].toString()));
      }

      if (file != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(file, filename: "file.pdf"),
        ));
      }

      if (Image != null) {
        formData.files.add(MapEntry(
          "Image",
          MultipartFile.fromBytes(Image, filename: "Image.jpg"),
        ));
      }

      String myurl = "$hostPort$createCurriculum";

      var response = await dio.post(
        myurl,
        data: formData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        gets.Get.back();

        gets.Get.back();

        Get_All_Curriculm_API(context).Get_All_Curriculm();
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
