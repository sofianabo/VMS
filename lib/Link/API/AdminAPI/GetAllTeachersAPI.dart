import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllTeachersController.dart';
import 'package:getx/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallteachersapi {
  Allteachercontroller c = Get.find<Allteachercontroller>();
  BuildContext context;
  Getallteachersapi(this.context);
  Dio dio = Dio();

  Getallteachers(String? name) async {
    String myurl = "${global.hostPort}${global.getTeachers}";
    var response = await dio.get(myurl,
        data: {
          "name": name,
        },
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${tokenPref!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllTeacherModel teacher = AllTeacherModel.fromJson(response.data);
      c.setAllTeacher(teacher);
    } else {
      return throw Exception("Failed to load Teachers");
    }
  }
}
