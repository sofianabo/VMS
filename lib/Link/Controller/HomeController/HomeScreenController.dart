import 'package:get/get.dart';
import 'package:vms_school/Link/Model/HomeModel.dart';

class Homescreencontroller extends GetxController {
  int teacher = 0;
  int student = 0;
  int visitor = 0;
  bool Isloading = true;

  String? enAddress;
  String? address;
  String? phonNumber;
  String? whatsAppNumber;
  String? urlYoutube;
  String? urlFaceBook;
  String? email;
  String? morningShiftStartHours;
  String? morningClosingHours;
  String? eveningShiftStartHours;
  String? eveningClosingHours;

  void getHomeInfo(HomeModel home) {
    teacher = home.teacher!;
    student = home.student!;
    visitor = home.visitors!;
    address = home.address ?? "";
    enAddress = home.enAddress ?? "";
    phonNumber = home.phonNumber ?? "";
    whatsAppNumber = home.whatsAppNumber ?? "";
    urlYoutube = home.urlYoutube ?? "";
    urlFaceBook = home.urlFaceBook ?? "";
    email = home.email ?? "";
    morningShiftStartHours = home.morningShiftStartHours ?? "";
    morningClosingHours = home.morningClosingHours ?? "";
    eveningShiftStartHours = home.eveningShiftStartHours ?? "";
    eveningClosingHours = home.eveningClosingHours ?? "";
    Setisloading(false);
    update();
  }

  Setisloading(bool value) {
    Isloading = value;
    update();
  }
}
