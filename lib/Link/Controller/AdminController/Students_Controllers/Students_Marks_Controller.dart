import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Marks_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Students_Marks_Controller extends GetxController {
  List<Classes>? classes;
  String? filterName = '';
  bool isLoading = true;
  Students_Marks_Model? studentsMarksModel;
  List<Student>? filterdstudent;

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Student> tempFilteredList = List.from(studentsMarksModel!.student!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.fullName?.toLowerCase() ?? '';

        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filterdstudent = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchByName("");
    update();
  }

  int semesterId = 1;
  List<String> Classlist = [];
  List<String> Divisionlist = [];
  List<String> Semesterlist = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];
  List<String> Curriculumlist = [];

  String ClassIndex = "";
  String DivisionIndex = "";
  String SemesterIndex = "The First Semester";
  String CurriculumIndex = "";

  bool isClassLoading = true;
  bool isDivisionLoading = true;
  bool isCurriculumLoading = true;

  SetisClassLoading(bool value) {
    isClassLoading = value;
    update();
  }

  SetisDivisionLoading(bool value) {
    isDivisionLoading = value;
    update();
  }

  SetisCurriculumLoading(bool value) {
    isCurriculumLoading = value;
    update();
  }

  void set_semesteridx(id) {
    semesterId = id;
    update();
  }

  SetClass(AllClassModel ClassModel) {
    List<String> classess = [];
    if (ClassModel.classes != null) {
      for (var g in ClassModel.classes!) {
        if (prefs!.getString(languageKey) == 'ar')
          classess.add(g.name.toString());
        else
          classess.add(g.enName.toString());
      }
    }
    ClassIndex = "";
    Classlist = [];
    classes = ClassModel.classes;
    Classlist = classess;
    isClassLoading = false;
    update();
  }

  SetDivisionList(List<String> value) {
    DivisionIndex = "";
    Divisionlist = [];
    Divisionlist = value;
    isDivisionLoading = false;
    update();
  }

  void SetCurriculum(Curriculum_Model curriculumModel) {
    isLoading = true;
    CurriculumIndex = "";
    Curriculumlist = [];

    List<String> curr = [];
    if (curriculumModel.curriculum != null) {
      for (var g in curriculumModel.curriculum!) {
        if (prefs!.getString(languageKey) == 'ar')
          curr.add(g.name.toString());
        else
          curr.add(g.enName.toString());
      }
    }
    Curriculumlist = curr;
    isCurriculumLoading = false;
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setStudentsMarksData(Students_Marks_Model studentsMarks) {
    studentsMarksModel = studentsMarks;
    filterdstudent = List.from(studentsMarks.student!);
    setIsLoading(false);
    update();
  }

  void addMarkForAllStudents({required int mark, required String type}) {
    if (studentsMarksModel == null || studentsMarksModel!.student == null)
      return;

    for (var student in filterdstudent!) {
      // البحث عن العلامة الحالية لهذا النوع
      final existingMarkIndex =
          student.mark?.indexWhere((m) => m.type == type) ?? -1;

      if (existingMarkIndex != -1) {
        // تحديث العلامة الموجودة
        student.mark![existingMarkIndex].mark = mark;
      } else {
        // إضافة علامة جديدة
        student.mark ??= [];
        student.mark!.add(Mark()
          ..type = type
          ..mark = mark);
      }
    }

    update(); // لتحديث الواجهة
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Class':
        ClassIndex = index ?? "";
        break;

      case 'Division':
        DivisionIndex = index ?? "";
        break;

      case 'Semester':
        SemesterIndex = index ?? "";
        break;

      case 'Curriculum':
        CurriculumIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'Class':
        Classlist = options;
        break;
      case 'Division':
        Divisionlist = options;
        break;
      case 'Semester':
        Semesterlist = options;
        break;
      case 'Curriculum':
        Curriculumlist = options;
        break;
    }
    update();
  }

  String getSelectedIndex(String type) {
    switch (type) {
      case 'Class':
        return ClassIndex;
      case 'Division':
        return DivisionIndex;
      case 'Semester':
        return SemesterIndex;
      case 'Curriculum':
        return CurriculumIndex;
      default:
        return '';
    }
  }

  void resetinClass() {
    isLoading = true;
    Divisionlist = [];
    DivisionIndex = "";
    CurriculumIndex = "";
    Curriculumlist = [];
    update();
  }

  void resetindivision() {
    isLoading = true;
    CurriculumIndex = "";
    Curriculumlist = [];
    update();
  }

  void resetinSemester() {
    isLoading = true;
    CurriculumIndex = "";
    Curriculumlist = [];
  }
}
