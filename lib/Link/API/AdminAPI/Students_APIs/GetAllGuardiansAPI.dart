import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Link/Model/AdminModel/allGuardianModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class GetAllGuardiansAPI {
  final Allgaurdiancontroller c = Get.find<Allgaurdiancontroller>();
  BuildContext context;
  GetAllGuardiansAPI(this.context);
  Dio dio = Dio();

  getAllGuardian() async {
    try {
      c.setIsLoading(true);
      String myurl = "${global.hostPort}${global.getguardians}";
      var response = await dio.get(myurl,
options: getDioOptions());
      if (response.statusCode == 200) {
        AllGuardianModel classes = AllGuardianModel.fromJson(response.data);
        c.setallGaurdian(classes);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
