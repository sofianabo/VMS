import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllPenaltyModel.dart';

class Penaltycontroller extends GetxController {
  var Penalties = <Map<String, dynamic>>[].obs;

  List<Penalty>? penalt;

  bool isLoading = true;

  setData(AllPenaltyModel pen) {
    penalt = pen.penalty;
    Penalties.clear();
    for (var stu in pen.penalty!) {
      Penalties.add({
        'id': stu.id.toString(),
        'name': stu.name.toString(),
        'enName': stu.enName.toString(),
        'description': stu.description.toString(),
      });
    }
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  DeletePenalty(int index) {
    Penalties.removeAt(index);
    update();
  }

  bool IsArnameError = false;
  bool IsEnnameError = false;
  bool IsdeError = false;
  bool IsArnameErrorEdit = false;
  bool IsEnnameErrorEdit = false;
  bool IsdeErrorEdit = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsArnameError = newValue;
        break;
      case 'enname':
        IsEnnameError = newValue;
        break;
      case 'detail':
        IsdeError = newValue;
        break;
      case 'editarname':
        IsArnameErrorEdit = newValue;
        break;
      case 'editenname':
        IsEnnameErrorEdit = newValue;
        break;
      case 'editdetail':
        IsdeErrorEdit = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }
}
