import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:vms_school/Link/Model/AdminModel/allGuardianModel.dart';
import 'package:vms_school/main.dart';
import '../API.dart' as global;

class GetAllGuardiansAPI {
  final Allgaurdiancontroller c = Get.find<Allgaurdiancontroller>();
  BuildContext context;
  GetAllGuardiansAPI(this.context);
  Dio dio = Dio();

  getAllGuardian() async {
    try {
      String myurl = "${global.hostPort}${global.getguardians}";
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
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
