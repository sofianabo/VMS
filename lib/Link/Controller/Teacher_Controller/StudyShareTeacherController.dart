import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/Link/Model/Teacher_Model/StudyShareTeacherModel.dart';
class Studyshareteachercontroller extends GetxController {

  StudySharee? studyshare;

  bool isLoading = true;

  void setStudyShare(StudyShareTeacherModel model) {
    studyshare = model.studySharee!;
    setIsLoading(false);

    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

 

}
