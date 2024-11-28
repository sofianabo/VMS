import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class StudyYearStudentsController extends GetxController {
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";

  List<String> sessionlist = ["Quiz", "Exam", "Midterm"];
  List<String> gradelist = ["first", "tow", "three"];
  List<String> classlist = ["one"];
  List<String> divisionlist = ["one"];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
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

  void setAllClasses(AllClassesModel clas) {
    classlist.clear();
    for (int j = 0; j < clas.classes.length; j++) {
      classlist.add(clas.classes[j].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  void setAllGrades(AllGradesModel grade) {
    gradelist.clear();
    for (int j = 0; j < grade.grades!.length; j++) {
      gradelist.add(grade.grades![j].enName.toString());
    }
    update();
    updateList("grade", gradelist);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;
}
