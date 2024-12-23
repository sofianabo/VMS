import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Subject_Model.dart';

class Subject_Controller extends GetxController {


  var Subjects = <Map<String, dynamic>>[
  ].obs;


  List<Subject>? subject;


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
      });
      subjectNames.add(subg.enName!);
    }
    Get.find<Curriculumn_Controller>().addlistsubject(subjectNames);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

}
