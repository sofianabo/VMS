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

  Getallstudent() async {
    String myurl = "${global.hostPort}${global.getStudents}";
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
