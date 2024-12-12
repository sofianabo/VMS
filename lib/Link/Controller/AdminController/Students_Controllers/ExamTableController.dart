import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';

class ExamTableController extends GetxController {
  String examTypeIndex = "";
  String examClassIndex = "";
  String examDivisionIndex = "";
  String examSeasonIndex = "";

  List<String> examType = [];
  List<String> examClass = [];
  List<String> examDivision = [];
  List<String> examSeason = [];

  List<Quiz> quizList = [];

  void setAllQuiz(ExamTableModel model) {
    quizList.clear();
    quizList = model.quiz!;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'type':
        examTypeIndex = index ?? "";
        break;
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
      case 'season':
        examSeasonIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllTypes(AllExamTypeModel types) {
    examType.clear();
    for (int j = 0; j < types.type!.length; j++) {
      examType.add(types.type![j].enName.toString());
    }
    update();
    updateList("type", examType);
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    for (int k = 0; k < division.division!.length; k++) {
      examDivision.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  void setAllSeason(AllSemesterModel semster) {
    examSeason.clear();
    for (int l = 0; l < semster.semester!.length; l++) {
      examSeason.add(semster.semester![l].enName.toString());
    }
    update();
    updateList("season", examSeason);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'type':
        examType = options;
        break;
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
      case 'season':
        examSeason = options;
        break;
    }
    update();
  }

  String get selectedExamType => examTypeIndex;

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
  String get selectedExamSeason => examSeasonIndex;
}
