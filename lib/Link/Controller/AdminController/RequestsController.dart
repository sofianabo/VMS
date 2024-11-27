import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';
import 'package:vms_school/Link/Model/AdminModel/RequestsModel.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';

class Requestscontroller extends GetxController {
  List<Registration> registration = [];
  List<Registration> filteredregistration = [];
  String statusindex = "";
  List<String> statusList = [];

  void setAllRequests(AllRequestsModel req) {
    registration = req.registration!;
    filteredregistration = List.from(req.registration!);
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
    update();
  }
    void setAllStatus(AllStatusModel stat) async {
    statusList.clear();
    for (int i = 0; i < stat.type!.length; i++) {
      statusList.add(stat.type![i].toString());
    }
    update();
    updateList(statusList);
  }


   void updateList(
    List<String> options,
  ) {
   
        statusList = options;
     
    update();
  }
    String get selectedstatusIndex => statusindex;

}
