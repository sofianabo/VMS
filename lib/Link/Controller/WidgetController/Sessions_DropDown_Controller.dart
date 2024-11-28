import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class All_Screen_Sessions_Controller extends GetxController {

  String sessionIndex = "";
  List<String> sessionlist = ["Quiz", "Exam", "Midterm"];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
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
    sessionIndex = "${session.current!.year}";
  }


  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

}
