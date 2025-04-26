import 'package:get/get.dart';

class Validateteachernoteandgradereco extends GetxController {
   bool isGroupNameError = false;
  bool isRatioError = false;
  bool isitemError = false;
  bool isitemRatioError = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case "groupName":
        isGroupNameError = newValue;
        break;

      case "ratio":
        isRatioError = newValue;
        break;
      case "item":
        isitemError = newValue;
        break;
      case "itemratio":
        isitemRatioError = newValue;
        break;
      default:
    }

    update();
  }

  void resetError() {
    isGroupNameError = false;
    isRatioError = false;
       isitemError = false;
   isitemRatioError = false;
    update();
  }
}