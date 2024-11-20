import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllEmployeeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:getx/Link/Model/AdminModel/allGuardianModel.dart';

class Allempolyeecontroller extends GetxController {
  List<Employees> employee = [];
  String sessionIndex = "";
  String jobTitleIndex = "";
  void setEmployee(AllEmployeeModel model) {
    employee = model.employees!;
    update();
  }


 List<String> JobTitleList = [];
  List<String> sessionlist = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'jobTitle':
        jobTitleIndex = index ?? "";
        break;
     
    }
    update();
  }
  void setAllSession(AllSessionModel session) async {
    sessionlist.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
      print(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
  }


  //   void setAllJobTitle(AllJobTitleModel job) async {
  //   JobTitleList.clear();
  //   for (int i = 0; i < job.sessions!.length; i++) {
  //     sessionlist.add(job.sessions![i].year.toString());
  //   }
  //   update();
  //   updateList("session", sessionlist);
  // }



   void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'jobTitle':
        JobTitleList = options;
        break;
    
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => jobTitleIndex;



  // void updateGuardian(
  //     String name, int index, String phone, String email, String nationalid) {
  //   guardian[index].name = name;
  //   guardian[index].phone = phone;
  //   guardian[index].email = email;
  //   guardian[index].nationalId = nationalid;
  //   update();
  // }
}
