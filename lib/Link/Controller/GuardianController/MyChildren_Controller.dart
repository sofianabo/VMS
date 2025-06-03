import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/Guardian_Model/MyChildren.dart';

class MyChildren_Controller extends GetxController {
  List<Students>? students;
  List<Students> filteredStudents = [];

  bool IsLoading = true;

  setIsloading(bool value) {
    IsLoading = value;
    update();
  }

  setMyChildren(MyChildren allstudents) {
    students = allstudents.students;
    filteredStudents = List.from(students!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    IsLoading = false;
    update();
  }

  String? filterName = '';

  String? guaName;

  void clearFilter() {
    searchByName("");
    update();
  }

  void Setname(String value) {
    guaName = value;
    update();
  }

  void searchByName(String? nameQuery) {
    List<Students> tempFilteredList = List.from(students!);
    filterName = nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final name = cur.fullName?.toLowerCase() ?? '';

        return name.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }

  List<String> SessionList = [];
  String SessionIndex = "";
  bool isLoadingSession = true;
  String startSessionDate = "";
  String endSessionDate = "";
  var sessionId;
  AllSessionModel? sessions;

  SetIsLoadingSession(bool value) {
    isLoadingSession = value;
    update();
  }

  void setAllSession(AllSessionModel session) async {
    sessions = session;

    SessionList.clear();

    sessionId = sessions?.current?.id;
    for (int i = 0; i < session.sessions!.length; i++) {
      SessionList.add(session.sessions![i].year.toString());
    }
    SetIsLoadingSession(false);
    update();
    updateList("session", SessionList);
    setSessionDefult();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        SessionIndex = index ?? "";
        break;
      default:
    }
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        SessionList = options;
        break;
      default:
    }
    update();
  }

  String getSelectedIndex(String type) {
    switch (type) {
      case 'session':
        return SessionIndex;
      default:
        return '';
    }
  }

  String get selectedSessionIndex => selectedSessionIndex;

  setSessionDefult() {
    try {
      sessionId = sessions!.current!.id!;
      SessionIndex = sessions!.current!.year!;
      startSessionDate = sessions!.current!.startDate!;
      endSessionDate = sessions!.current!.endDate!;
      update();
    } catch (e) {
      print(e);
    }
  }

  setSessiondatepick() {
    try {
      startSessionDate = sessions!.current!.startDate!;
      endSessionDate = sessions!.current!.endDate!;
      update();
    } catch (e) {
      print(e);
    }
  }

  void setsessionid(id) {
    sessionId = id;
    var session = sessions!.sessions!.firstWhere((session) => session.id == id);
    startSessionDate = session.startDate!;
    endSessionDate = session.endDate!;
    update();
  }
}
