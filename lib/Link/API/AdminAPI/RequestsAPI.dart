import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/RequestsController.dart';
import 'package:getx/Link/Model/AdminModel/RequestsModel.dart';
import 'package:getx/main.dart';
import '../API.dart' as global;

class GetAllRequestsapi {
  Requestscontroller c = Get.find<Requestscontroller>();
  BuildContext context;
  GetAllRequestsapi(this.context);
  Dio dio = Dio();

  GetAllRequests() async {
    String myurl = "${global.hostPort}${global.getRequests}";
    var response = await dio.get(myurl,
        data: {},
        options: Options(headers: {
          'accept': 'application/json',
          'authorization': 'Bearer ${prefs!.getString("token")}'
        }));
    if (response.statusCode == 200) {
      AllRequestsModel requests = AllRequestsModel.fromJson(response.data);
      c.setAllRequests(requests);
    } else {
      return throw Exception("Failed to load requests");
    }
  }
}
