import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';

import 'package:vms_school/Link/Model/LMS_Model/PagesLmsModel.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Allquizcontroller extends GetxController {
  List<QuizLms>? quizLMS;
  List<QuizLms> filtered_quizLMS = [];

  String? filterName = '';
  List<String> currList = [];
  String currindex = "";
  String dialog_currIndex = "";
  List<String> dialogCurrList = [];

  void clearFilter() {
    searchByName("", currindex);
    update();
  }

  void searchByName(String? nameQuery, String? curiculumName) {
    filterName = nameQuery;
    List<QuizLms> tempFilteredList = List.from(quizLMS!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (curiculumName != null && curiculumName.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        print("ffffff" + cur.curriculumName!);
        print("ssssss" + curiculumName);
        return cur.curriculumName! == curiculumName ||
            cur.curriculumEnName! == curiculumName;
      }).toList();
    }

    filtered_quizLMS = tempFilteredList;
    update();
  }

  bool isLoading = true;

  RxString fileName = "".obs;

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'curriculum':
        currindex = index ?? "";
        break;
      case 'currDialog':
        dialog_currIndex = index ?? "";
        break;
    }
    searchByName(
      filterName,
      currindex,
    );
    update();
  }

  bool isCuriculmLoading = false;
  bool isCuriculmDialogLoading = false;

  void setisCurriculmLoading(bool bool) {
    isCuriculmLoading = bool;
    update();
  }

  void setisCurriculmDialogLoading(bool bool) {
    isCuriculmDialogLoading = bool;
    update();
  }

  setCurriculum(Curriculum_Model curruculum) {
    currList.clear();
    dialogCurrList.clear();
    for (int i = 0; i < curruculum.curriculum!.length; i++) {
      currList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? curruculum.curriculum![i].name!
              : curruculum.curriculum![i].enName!);
      dialogCurrList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? curruculum.curriculum![i].name!
              : curruculum.curriculum![i].enName!);
    }
    updateList("currDialog", dialogCurrList);
    updateList("curriculum", currList);
    setisCurriculmLoading(false);
    setisCurriculmDialogLoading(false);

    update();
  }

  void SetQuizLms(AllQuizLmsModel links) {
    quizLMS = links.quizLms;

    filtered_quizLMS = List.from(quizLMS!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }

    if (currindex.isNotEmpty) {
      filtered_quizLMS = filtered_quizLMS.where((emp) {
        return emp.curriculumName! == currindex ||
            emp.curriculumEnName! == currindex;
      }).toList();
    }

    SetIsLoading(false);
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'curriculum':
        currList = options;
        break;
      case 'currDialog':
        dialogCurrList = options;
        break;
    }
    update();
  }

  String get selectCurrIndex => currindex;

  String get selectdialog_CurrIndex => dialog_currIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  bool IsAnameError = false;
  bool iscurrError = false;
  bool isPageError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'page':
        isPageError = newValue;
        break;
      case 'curr':
        iscurrError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }

  bool Hidden = false;
  updateHid(bool value) {
    Hidden = value;
    update();
  }

  void reset() {
    Hidden = false;
    dialog_currIndex = "";
    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    isPageError = false;
    update();
  }
}
