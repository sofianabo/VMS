import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';

class Vaccines_Controller extends GetxController {
  String? filterName = '';

  List<Vaccine>? vaccine;
  List<Vaccine>? filteredvaccine;

  bool isLoading = true;
  bool isLoadingLocation = true;

  List<String> Locationlist = [];
  String LocationIndex = "";

  SetIsLoadingLocation(bool value) {
    isLoadingLocation = value;
    update();
  }

  SetLocationlist(List<String> data) {
    Locationlist = data;
    SetIsLoadingLocation(false);
    update();
  }

  var chronic = false.obs;
  void togglechronic(bool value) {
    chronic.value = value;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Vaccine> tempFilteredList = List.from(vaccine!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredvaccine = tempFilteredList;
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

  void SetData(Vaccines_Model vac) {
    vaccine = vac.vaccine;
    filteredvaccine = List.from(vaccine!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    SetIsLoading(false);
    update();
  }
}
