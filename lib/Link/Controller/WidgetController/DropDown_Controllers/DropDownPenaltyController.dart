import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class Dropdownpenaltycontroller extends GetxController {
  List<String> penalties = [];
  bool Isloading = true;

  void setPenalty(AllPenaltyModel penalt) {
    penalties.clear();
    List<String> newlis = [];
    for (int i = 0; i < penalt.penalty!.length; i++) {
      penalties.add(penalt.penalty![i].type.toString());
      newlis.add(penalt.penalty![i].type.toString());
    }
    Get.find<StudyYearStudentsController>().setAllPenalty(newlis);
    Isloading = false;
    update();
  }
  setIsLoading(bool value){
    Isloading = value;
    update();
  }
}
