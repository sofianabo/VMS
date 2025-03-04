import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Profile_DropDown_Controller extends GetxController {
  String selecteGenderIndex = "";
  String selecteFamily_StatusIndex = "";

  List<String> GenderList = ["Male", "Female"];
  List<String> Family_StatusList = ["Single", "Married", "Divorced"];

  void selectIndex(String type, String value) {
    if (type == 'Gender') {
      selecteGenderIndex = value;
    } else if (type == 'Family_Status') {
      selecteFamily_StatusIndex = value;
    }
    update();
  }
}
