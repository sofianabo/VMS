import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/Link/Controller/UserController.dart';
import 'package:getx/Link/Model/UserModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Editguardianapi {
  final Allgaurdiancontroller u = Get.find<Allgaurdiancontroller>();
  Editguardianapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Editguardian(int id, String name, String email, String nationalid,
      String phone, int index) async {
    String myurl = "${global.hostPort}${global.editGuardian}";
    try {
      var response = await dio.post(myurl,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "guardianId": id,
            "email":email
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${tokenPref!.getString("token")}' 
          }));
      if (response.statusCode == 200) {
        u.updateGuardian(name, index, phone, email, nationalid);
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('Login field');
    }
  }
}
