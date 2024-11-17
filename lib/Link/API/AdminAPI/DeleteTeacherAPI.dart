import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Deleteteacherapi {
  Deleteteacherapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deleteteacher(int id) async {
    String myurl = "${global.hostPort}${global.deleteTeacher}";
    try {
      var response = await dio.post(myurl,
          data: {"id": id},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${tokenPref!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await Getallteachersapi(context).Getallteachers(null);
        Get.back();
      } else {
        return throw Exception("Failed");
      }
      return response.statusCode;
    } catch (e) {
      print('delete Field');
    }
  }
}
