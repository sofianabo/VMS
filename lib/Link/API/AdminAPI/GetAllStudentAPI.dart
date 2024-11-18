import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallstudentapi {
  final Allstudentscontroller c = Get.find<Allstudentscontroller>();
  BuildContext context;
  Getallstudentapi(this.context);
  Dio dio = Dio();

  Getallstudent(String? name) async {
    Allstudentscontroller c = Get.find<Allstudentscontroller>();
    String myurl = "${global.hostPort}${global.getStudents}";
    var response = await dio.get(myurl,
    data: {
      "name":name,
    },
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${prefs!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      // AllGuardianModel classes = AllGuardianModel.fromJson(response.data);
      // c.getallGaurdian(classes);
    } else {
      return throw Exception("Failed to load Students");
    }
  }
}
