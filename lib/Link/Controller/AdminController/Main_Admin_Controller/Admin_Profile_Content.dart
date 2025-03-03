import 'package:get/get.dart';

class Admin_Profile_Content extends GetxController {
  String curruntValue = "Profile";

  ChangeCurruntValue(String value) {
    curruntValue = value;
    update();
  }
}
