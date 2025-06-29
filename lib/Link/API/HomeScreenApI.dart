import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/HomeController/HomeScreenController.dart';
import 'package:vms_school/Link/Model/HomeModel.dart';
import 'API.dart' as global;

class Homescreenapi {
  final Homescreencontroller u = Get.find<Homescreencontroller>();
  Homescreenapi(this.context);
  BuildContext context;
  Dio dio = Dio();
  homescreen() async {
    String myurl = "${global.hostPort}${global.Home}";
    try {
      u.Setisloading(true);
      var response = await dio.get(myurl, options: getDioOptions());
      HomeModel home = HomeModel.fromJson(response.data);
      u.getHomeInfo(home);
      return response.statusCode;
    } catch (e) {}
  }
}

//
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vms_school/Link/API/DioOption.dart';
// import 'package:vms_school/Link/Controller/HomeController/HomeScreenController.dart';
// import 'package:vms_school/Link/Model/HomeModel.dart';
// import 'API.dart' as global;
//
// class Homescreenapi {
//   final Homescreencontroller u = Get.find<Homescreencontroller>();
//   Homescreenapi(this.context);
//   BuildContext context;
//   Dio dio = Dio();
//   Future<void> homescreen() async {
//     final stopwatch = Stopwatch()..start(); // بدء قياس الوقت
//
//     String myurl = "${global.hostPort}${global.Home}";
//
//     try {
//       for (int i = 0; i < 70; i++) {
//         var response =
//         dio.get(myurl, options: getDioOptions()); // أضفت await هنا
//         print(i);
//       }
//     } finally {
//       stopwatch.stop(); // إيقاف قياس الوقت
//       print('الوقت الإجمالي المستغرق: ${stopwatch.elapsed}');
//       print('الوقت بالميلي ثانية: ${stopwatch.elapsedMilliseconds}ms');
//       print('الوقت بالثواني: ${stopwatch.elapsed.inSeconds}seconds');
//     }
//   }
// }
