import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Classes_Model.dart';

class Home_Controller_LMS extends GetxController {
  List<Classes>? classes;
  List<Classes>? filteredreclasses = [];

  bool isLoading = true;
  void SetIsLoading(bool bool) {
    isLoading = bool;
    update();
  }

  void SetClasses(Classes_LMS allClassModel) {
    classes = allClassModel.classes;
    filteredreclasses = List.from(classes!);
    SetIsLoading(false);
    update();
  }

  void searchRequestByName(String gradeindexed) {
    List<Classes> tempFilteredList = List.from(classes!);

    if (gradeindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.grade!.name == gradeindexed ||
            emp.grade!.enName == gradeindexed;
      }).toList();
    }

    filteredreclasses = tempFilteredList;
    update();
  }
}
