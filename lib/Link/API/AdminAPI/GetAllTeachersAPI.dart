import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/AllTeacherController.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallteachersapi {
  // final Allstudentscontroller c = Get.find<Allstudentscontroller>();
  BuildContext context;
  Getallteachersapi(this.context);
  Dio dio = Dio();

  Getallteachers() async {
    Allteachercontroller c = Get.find<Allteachercontroller>();
    String myurl = "${global.hostPort}${global.getTeachers}";
    var response = await dio.get(myurl,
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${tokenPref!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      // AllGuardianModel classes = AllGuardianModel.fromJson(response.data);
      // c.getallGaurdian(classes);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}
