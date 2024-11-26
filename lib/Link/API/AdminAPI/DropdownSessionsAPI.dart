import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/Error_API.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/DropDownSessionController.dart.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getsessionapi {
  Dropdownsessioncontroller c = Get.find<Dropdownsessioncontroller>();
  BuildContext context;
  Getsessionapi(this.context);
  Dio dio = Dio();

  Getsession() async {
    try {
      String myurl = "${global.hostPort}${global.getSession}";
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        AllSessionModel session = AllSessionModel.fromJson(response.data);
        c.setSession(session);
        return session;
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
