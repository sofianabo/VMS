import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getsessionapi {
  Allstudentscontroller c = Get.find<Allstudentscontroller>();
  BuildContext context;
  Getsessionapi(this.context);
  Dio dio = Dio();

  Getsession() async {
    String myurl = "${global.hostPort}${global.getSession}";
    var response = await dio.get(myurl,
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${prefs!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllSessionModel session = AllSessionModel.fromJson(response.data);
      c.setAllSession(session);
    } else {
      return throw Exception("Failed to load session");
    }
  }
}
 