import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Model/Guardian_Model/Guardian_MyData_Model.dart';
import 'package:vms_school/main.dart';

class Guardian_My_Data_Controller extends GetxController {
  bool isLoading = true;
  Guardian_MyData_Model? guardianMyData;
  SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setGuardianMyData(Guardian_MyData_Model gmd) {
    guardianMyData = gmd;
    Get.find<MyChildren_Controller>().Setname(gmd.data!.fullName ?? "");
    prefs!.setString("fullname", gmd.data!.fullName ?? "");
    isLoading = false;
    update();
  }
}
