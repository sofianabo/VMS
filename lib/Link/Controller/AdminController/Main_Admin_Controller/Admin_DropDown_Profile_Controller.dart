import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Profile_DropDown_Controller extends GetxController {
  String GenderIndex = "";
  String Family_StatusIndex = "";

  List<String> GenderList = ["Male", "Female"];
  List<String> Family_StatusList = ["Single", "Married", "Divorced"];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Gender':
        GenderIndex = index ?? "";
        break;
      case 'Family_Status':
        Family_StatusIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'Gender':
        GenderList = options;
        break;
      case 'Family_Status':
        Family_StatusList = options;
        break;
    }
    update();
  }

  String get selecteGenderIndex => GenderIndex;

  String get selecteFamily_StatusIndex => Family_StatusIndex;
}
