import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/RequestsModel.dart';
import 'package:getx/Link/Model/AuthModel/UserModel.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [];
  

  void setAllRequests(AllRequestsModel req) {
    registration = req.registration!;
    update();
  }
}
