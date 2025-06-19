import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/NumberOfContentController.dart';

class Selected_Class_Controller extends GetxController {
  List<String> moveMenu = [];
  int? classid = 1;
  int? divisionid;

  initialinClass(String value, int id) {
    moveMenu = [];
    moveMenu.add(value);
    classid = id;
    update();
  }

  void addToPath(String value) {
    final existingIndex = moveMenu.indexOf(value);
    if (existingIndex != -1) {
      moveMenu = moveMenu.sublist(0, existingIndex + 1);
    } else {
      moveMenu.add(value);
    }
    update();
  }

  // عند الضغط على عنصر: نمسح كل ما بعده
  void onItemTap(int index) {
    moveMenu = moveMenu.sublist(0, index + 1);
    update();
    print('المسار الحالي: ${moveMenu.join(" / ")}');
  }

  var controller = Get.find<Numberofcontentcontroller>();

  var dataList = <Map<String, dynamic>>[].obs;

  SetDataList(List<Map<String, dynamic>> data) {
    dataList.addAll(data);
    setIsLoading(false);
    update();
  }

  bool isLoading = false;

  setIsLoading(bool val) {
    isLoading = val;
    update();
  }
}
