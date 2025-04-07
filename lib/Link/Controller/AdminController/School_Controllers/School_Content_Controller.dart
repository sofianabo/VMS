import 'package:get/get.dart';

class School_Content_Controller extends GetxController {
  bool IsCountError = false;
  bool IsnameError = false;
  bool IsennameError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsnameError = newValue;
        break;
      case 'enname':
        IsennameError = newValue;
        break;
      case 'count':
        IsCountError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  bool isLoading = true;
  SetisLoading(bool value) {
    isLoading = value;
    update();
  }
}
