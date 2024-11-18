import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllGuardiansAPI.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Addguardianapi {
  final Allgaurdiancontroller u = Get.find<Allgaurdiancontroller>();
  Addguardianapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  addguardian(String name, String email, String nationalid, String phone,
      String username, String password) async {
    String myurl = "${global.hostPort}${global.addGuardian}";
    try {
      var response = await dio.post(myurl,
          data: {
            "name": name,
            "phone": phone,
            "nationalId": nationalid,
            "email": email,
            "userName": username,
            "password": password
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${prefs!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await GetAllGuardiansAPI(context).getAllGuardian();
        Get.back();
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('Add field');
    }
  }
}
