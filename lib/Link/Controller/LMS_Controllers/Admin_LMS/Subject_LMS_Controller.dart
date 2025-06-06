import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Subject_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Subject_LMS_Controller extends GetxController {
  var Subjects = <Map<String, dynamic>>[].obs;

  List<Subject>? subject;

  DeleteSubject(int index) {
    Subjects.removeAt(index);
    update();
  }

  bool isLoading = true;
  setData(Subject_Model Subject) {
    subject = Subject.subject;
    Subjects.clear();

    List<String> subjectNames = [];
    for (var subg in Subject.subject!) {
      Subjects.add({
        'id': subg.id,
        'name': subg.name,
        'enName': subg.enName,
        'hasCurriculum': subg.hasCurriculum,
      });
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        subjectNames.add(subg.name!);
      else
        subjectNames.add(subg.enName!);
    }
    Get.find<Curriculumn_LMS_Controller>().addlistsubject(subjectNames);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  bool IsArnameError = false;
  bool IsEnnameError = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsArnameError = newValue;
        break;
      case 'enname':
        IsEnnameError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }
}
