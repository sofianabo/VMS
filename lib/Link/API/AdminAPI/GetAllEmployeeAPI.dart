import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/DropdownClassesAPI.dart';
import 'package:getx/Link/API/AdminAPI/DropdownGradeAPI.dart';
import 'package:getx/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:getx/Link/Controller/AdminController/AllEmpolyeeController.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/Link/Model/AdminModel/AllEmployeeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:getx/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallemployeeapi {
  final Allempolyeecontroller c = Get.find<Allempolyeecontroller>();
  BuildContext context;
  Getallemployeeapi(this.context);
  Dio dio = Dio();

  Getallemployee(String? name) async {
    AllSessionModel s = await Getsessionapi(context).Getsession();
    //  AllJobTilteModle j = await GetAllJobTitleAPI(context).GetAllJobTitle();
    c.setAllSession(s);
    //c.setJobTitle(j);

    String myurl = "${global.hostPort}${global.getEmployee}";
    var response = await dio.get(myurl,
        data: {
          "name": name,
        },
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${prefs!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllEmployeeModel emplyee = AllEmployeeModel.fromJson(response.data);
      c.setEmployee(emplyee);
    } else {
      return throw Exception("Failed to load employees");
    }
  }
}
