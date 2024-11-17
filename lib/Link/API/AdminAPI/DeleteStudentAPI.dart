import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllStudentAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:getx/Link/Controller/AdminController/AllTeachersController.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class Deletestudentapi {
  Deletestudentapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  Deletestudent(
  
  ) async {
    String myurl = "${global.hostPort}${global.deleteStudent}";
    try {
      var response = await dio.post(myurl,
          data: {
           
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${tokenPref!.getString("token")}'
          }));
      if (response.statusCode == 200) {
        await Getallstudentapi(context).Getallstudent(null);
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
