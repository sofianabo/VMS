import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Marks_Model.dart';

class Students_Marks_Controller extends GetxController {
  bool isLoading = true;
  Students_Marks_Model? studentsMarksModel;

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setStudentsMarksData(Students_Marks_Model studentsMarks) {
    studentsMarksModel = studentsMarks;
    setIsLoading(false);
    update();
  }
}
