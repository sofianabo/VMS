import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Division_LMS_Model.dart';

class LMS_Divisions_Controller extends GetxController {
  List<Division>? division;

  bool isLoading = true;

  void SetIsloading(bool value) {
    isLoading = value;
    update();
  }

  void setDivisions(Division_LMS_Model lmsDivisionModel) {
    division = lmsDivisionModel.division;
    SetIsloading(false);
    update();
  }
}
