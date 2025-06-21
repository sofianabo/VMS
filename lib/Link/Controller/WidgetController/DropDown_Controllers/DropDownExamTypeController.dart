import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';

class Dropdownexamtypecontroller extends GetxController {
  List<String> examType = [];
  List<Type> alltype = [];
  void setTypes(AllExamTypeModel type) {
    examType.clear();
    alltype = type.type!;
    for (int i = 0; i < type.type!.length; i++) {
      examType.add(type.type![i].name.toString());
    }
    Get.find<ExamTableController>().setisTypeLoading(false);
    Get.find<Allquizcontroller>().setisTypeLoading(false);
    update();
  }
}
