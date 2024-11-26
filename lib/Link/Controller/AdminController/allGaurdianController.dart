import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/allGuardianModel.dart';

class Allgaurdiancontroller extends GetxController {
  List<Gaurdians> guardian = [];

  void setallGaurdian(AllGuardianModel model) {
    guardian = model.gaurdians!;
    update();
  }

  void updateGuardian(
      String name, int index, String phone, String email, String nationalid) {
    guardian[index].name = name;
    guardian[index].phone = phone;
    guardian[index].email = email;
    guardian[index].nationalId = nationalid;
    update();
  }

  

}
