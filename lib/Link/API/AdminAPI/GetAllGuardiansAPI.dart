import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/Link/Model/AdminModel/allGuardianModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class GetAllGuardiansAPI {
  final Allgaurdiancontroller c = Get.find<Allgaurdiancontroller>();
  BuildContext context;
  GetAllGuardiansAPI(this.context);
  Dio dio = Dio();

  getAllGuardian() async {
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
      return throw Exception("Failed to load Gurdians");
    }
  }
}
