import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolContentModel.dart';
import 'package:vms_school/Translate/local_controller.dart';

class School_Content_Controller extends GetxController {
  bool IsnameError = false;
  bool IsennameError = false;

  List<Data>? model;
  var Contents = <Map<String, dynamic>>[].obs;

  DeleteContent(int index) {
    model!.removeAt(index);
    update();
  }

  SetData(SchoolContentModel m) {
    model = m.data;
    Contents.clear();

    List<String> contentNames = [];
    for (var contenet in m.data!) {
      Contents.add({
        'id': contenet.id,
        'name': contenet.name,
        'enName': contenet.enName,
      });
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        contentNames.add(contenet.name!);
      else
        contentNames.add(contenet.enName!);
    }

    SetisLoading(false);
    update();
  }

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsnameError = newValue;
        break;
      case 'enname':
        IsennameError = newValue;
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
