import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [];
  List<Registration> filteredregistration = [];
  String statusindex = "";
  List<String> statusList = [];
  bool IsLoading = true;
  void setAllRequests(AllRequestsModel req) {
    registration = req.registration!;
    filteredregistration = List.from(req.registration!);
    IsLoading = false;

    update();
  }

  void restor() {
    registration.clear();
    filteredregistration.clear();
    IsLoading = true;
    update();
  }

  void searchRequestByName(String query) {
    if (query.isEmpty) {
      filteredregistration = List.from(registration);
    } else {
      filteredregistration = registration.where((requests) {
        final studentName = requests.student?.name?.toLowerCase() ?? '';
        final guardianName = requests.guardian?.name?.toLowerCase() ?? '';
        return studentName.contains(query.toLowerCase()) ||
            guardianName.contains(query.toLowerCase());
      }).toList();
    }
    update();
  }

   void selectIndex(String type, String? index) {
   
        statusindex = index ?? "";
      
  }

    void setAllStatus(AllStatusModel stat) async {
    statusList.clear();
    for (int i = 0; i < stat.type!.length; i++) {
      statusList.add(stat.type![i].toString());
    }
    update();
    updateList("session", statusList);
  }

  void updateList(
    String type,
    List<String> options,
  ) {
        statusList = options;
    
    update();
  }
    String get selectedStatusIndex => statusindex;

}
