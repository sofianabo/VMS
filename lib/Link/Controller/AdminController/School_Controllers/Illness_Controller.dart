import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Illness_Model.dart';

class Illness_Controller extends GetxController {
  String? filterName = '';

  List<Illness>? illness;
  List<Illness>? filteredIllness;

  bool isLoading = true;

  var chronic = false.obs;
  void togglechronic(bool value) {
    chronic.value = value;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Illness> tempFilteredList = List.from(illness!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredIllness = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchByName("");
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void SetData(Illness_Model illness_Model) {
    illness = illness_Model.illness;
    filteredIllness = List.from(illness!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    SetIsLoading(false);
    update();
  }
}
