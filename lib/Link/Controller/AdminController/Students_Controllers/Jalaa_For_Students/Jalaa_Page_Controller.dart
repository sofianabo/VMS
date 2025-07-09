import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Models/QuizTypeForSemesterJalaa.dart'
    as Qt;
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

import '../../../../Model/AdminModel/Students_Models/Jalaa_Models/Class_Model.dart';

class Jalaa_Page_Controller extends GetxController {
  List<Map<String, dynamic>> jalaas = [
    {
      "id": 1,
      "image": "assets/images/Jalaa_Templete/1-4.png",
      "text": "قالب ابتدائي (تقديرات)",
    },
    {
      "id": 2,
      "image": "assets/images/Jalaa_Templete/5-6.png",
      "text": "قالب ابتدائي (خامس وسادس)",
    },
    {
      "id": 3,
      "image": "assets/images/Jalaa_Templete/7-8.png",
      "text": "قالب إعدادي (سابع وثامن)",
    },
    {
      "id": 4,
      "image": "assets/images/Jalaa_Templete/9.png",
      "text": "قالب إعدادي (تاسع)",
    },
  ];
  List<Data>? classes;
  List<Curriculum> curriculum = [];

  List<Curriculum> primarySubjects = [];
  List<Curriculum> secondarySubjects = [];

  void addToPrimary(List<Curriculum> selected) {
    primarySubjects = selected;
    update();
  }

  void addToSecondary(List<Curriculum> selected) {
    secondarySubjects = selected;
    update();
  }

  void reorderPrimarySubjects(int oldIndex, int newIndex) {
    final item = primarySubjects.removeAt(oldIndex);
    primarySubjects.insert(newIndex, item);
    update();
  }

  void reorderSecondarySubjects(int oldIndex, int newIndex) {
    final item = secondarySubjects.removeAt(oldIndex);
    secondarySubjects.insert(newIndex, item);
    update();
  }

  List<int> getPrimaryIds() => primarySubjects.map((e) => e.id!).toList();
  List<int> getSecondaryIds() => secondarySubjects.map((e) => e.id!).toList();
  List<int> getSemester() =>
      [...selectedFirst.map((e) => e.id!), ...selectedSecond.map((e) => e.id!)];

  int Classid = 0;
  int templeteId = 0;

  // Loading
  bool isLoading = false;
  bool isClassLoading = false;
  List<int> filteredCurriculum = [0];
  void setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  // Page View logic
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  int get count => jalaas.length;

  void nextPage() {
    if (currentIndex.value < count - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      final index = pageController.page?.round() ?? 0;
      if (currentIndex.value != index) {
        currentIndex.value = index;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void SetClassIsLoading(bool bool) {
    isClassLoading = bool;
    update();
  }

  void SetClasses(Class_Jalaa allClassModel) {
    classes = allClassModel.data;
    isClassLoading = false;
    update();
  }

  bool isCurrLoading = false;

  void SetCurrIsLoading(bool bool) {
    isCurrLoading = bool;
    update();
  }

  void SetisQtLoading(bool bool) {
    isQtLoading = bool;
    update();
  }

  void SetCurriculum(Curriculum_Model curriculumModel) {
    curriculum = curriculumModel.curriculum!;
    primarySubjects = [];
    secondarySubjects = [];
    SetCurrIsLoading(false); // خلص التحميل
    update();
  }

  List<Qt.FirstSemster> selectedFirst = [];
  List<Qt.FirstSemster> selectedSecond = [];

  Qt.Semester? semester;
  bool isQtLoading = true;

  void setSemester(Qt.QuizTypeForSemesterJalaa model) {
    semester = model.semester;
    isQtLoading = false;
    update();
  }

  void onReorderSemester(int oldIndex, int newIndex, String semesterType) {
    List list = semesterType == 'first' ? selectedFirst : selectedSecond;

    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    update();
  }

  void showSelectDialog(BuildContext context, String semesterType) {
    final allItems = semesterType == 'first'
        ? semester?.firstSemster ?? []
        : semester?.secondSemster ?? [];

    final selectedItems =
        semesterType == 'first' ? selectedFirst : selectedSecond;

    final tempSelected = [...selectedItems];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return VMSProfileAlertDialog(
                action: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("الغاء"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (semesterType == 'first') {
                            selectedFirst = tempSelected;
                          } else {
                            selectedSecond = tempSelected;
                          }
                          update();
                          Navigator.pop(context);
                        },
                        child: Text("تم"),
                      ),
                    ],
                  )
                ],
                contents: SizedBox(
                  width: 500,
                  height: 300,
                  child: ListView(
                    children: allItems.map((item) {
                      final isSelected =
                          tempSelected.any((e) => e.id == item.id);

                      return CheckboxListTile(
                        title: Text(item.name ?? ''),
                        value: isSelected,
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              tempSelected.add(item);
                            } else {
                              tempSelected.removeWhere((e) => e.id == item.id);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                apptitle: "اختر الكويزات",
                subtitle: "none");
          },
        );
      },
    );
  }

  initialData() {
    secondarySubjects.clear();
    primarySubjects.clear();
    currentIndex.value = 0;
    selectedFirst.clear();
    selectedSecond.clear();
  }
}
