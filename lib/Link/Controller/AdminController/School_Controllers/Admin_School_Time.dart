import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/School_Management/Tables/SchoolTimeTable.dart';

class AdminSchoolTimeController extends GetxController {
  String examClassIndex = "";
  String examDivisionIndex = "";
  String subjectDialogIndex = "";
  String teacherDialogIndex = "";
  String timeLessonIndex = "Morning";

  List<String> examClass = [];
  List<String> examDivision = [];
  List<Division>? allDivision;
  List<String> subjectDialogList = [];
  List<String> teacherDialogList = [];
  List<Teachers>? allteacherDialogList;

  List<Curriculummm>? allsubjectDialogList = [];

  List<StudyShare> studyshare = [];
  List<String> timeLessonList = ['Morning', 'Evening'];

  bool isLoading = true;
  bool isLoadingClass = true;
  bool isLoadingDivision = true;

  set_Edite_Data(String teacherdialog,String curriculmdialog) {
  
    teacherDialogIndex = teacherdialog;
    subjectDialogIndex = curriculmdialog;
    update(['dialog_data']);
  }

  setTimeLessonIndex() {
    timeLessonIndex = 'Morning';
    update();
  }

  setIsLoadingClass(bool value) {
    isLoadingClass = value;
    update();
  }

  setIsLoadingDivision(bool value) {
    isLoadingDivision = value;
    update();
  }

  void initStudyShare() {
    tableData.clear();
    update();
  }

  void setStudyShare(SchoolTimeModel model) {
    studyshare = model.studyShare!;
    setIsLoading(false);

    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
      case 'subjectDialog':
        subjectDialogIndex = index ?? "";
        break;
      case 'teacherDialog':
        teacherDialogIndex = index ?? "";
        break;
      case 'time':
        timeLessonIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      if ( Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar')
        examClass.add(clas.classes![j].name.toString());
      else
        examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    setIsLoadingDivision(false);
    allDivision = division.division;
    for (int j = 0; j < division.division!.length; j++) {
      if ( Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar')
        examDivision.add(division.division![j].name.toString());
      else
        examDivision.add(division.division![j].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  bool isLoadingTeacher = true;
  bool isLoadingCurr = true;

  SetisLoadingTeacher(bool value) {
    isLoadingTeacher = value;
    update();
  }

  SetisLoadingcurr(bool value) {
    isLoadingCurr = value;
    update();
  }

  void setAllTeacherDialog(AllTeacherModel teach) {
    teacherDialogList.clear();
    allteacherDialogList = teach.teachers!;
    for (int j = 0; j < teach.teachers!.length; j++) {
      teacherDialogList.add(teach.teachers![j].fullName!);
    }
    updateList("teacherDialog", teacherDialogList);
    update();
  }

  void setAllSubjectDialog(DropDowmCuriculmModel curr) {
    subjectDialogList.clear();
    allsubjectDialogList = curr.curriculum!;
    for (int j = 0; j < curr.curriculum!.length; j++) {
      if ( Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar')
        subjectDialogList.add(curr.curriculum![j].name.toString());
      else
        subjectDialogList.add(curr.curriculum![j].enName.toString());
    }

    update();
    updateList("subjectDialog", subjectDialogList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
      case 'teacherDialog':
        teacherDialogList = options;
        break;
      case 'subjectDialog':
        subjectDialogList = options;
        break;
      case 'time':
        timeLessonList = options;
        break;
    }
    update();
  }

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
  String get selectedSubjectDialog => subjectDialogIndex;
  String get selectedTeacherDialog => teacherDialogIndex;
  String get selectedTimeLesson => timeLessonIndex;

  void setDevisionindex() {
    examDivisionIndex = "";
    update();
  }

  void setClassIndex() {
    examClassIndex = "";
    update();
  }

  SetClasslist(List<String> data) {
    examClass = data;
    setIsLoadingClass(false);
    update();
  }

  bool IteacherError = false;
  bool ISsubError = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'teach':
        IteacherError = newValue;
        break;
      case 'sub':
        ISsubError = newValue;
        break;
      default:
    }
    update();
  }
}
