import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllClassesController.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/DropDownGradeController.dart.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallgradeapi {
  Dropdowngradecontroller c = Get.find<Dropdowngradecontroller>();
  BuildContext context;
  Getallgradeapi(this.context);
  Dio dio = Dio();

  Getallgrade() async {
    String myurl = "${global.hostPort}${global.getGrade}";
    var response = await dio.get(myurl,
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${prefs!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllGradesModel grade = AllGradesModel.fromJson(response.data);
      c.setGrades(grade);
      return grade;
    } else {
      return throw Exception("Failed to load grade");
    }
  }
}
