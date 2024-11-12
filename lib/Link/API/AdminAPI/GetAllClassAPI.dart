import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllClassesController.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Getallclassapi {
  final Allclassescontroller c = Get.find<Allclassescontroller>();
  BuildContext context;
  Getallclassapi(this.context);
  Dio dio = Dio();

  getAllClasses() async {
    String myurl = "${global.hostPort}${global.getclasses}";
    var response = await dio.get(myurl,
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${tokenPref!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllClassesModel classes = AllClassesModel.fromJson(response.data);
      c.getAllClasses(classes);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}
