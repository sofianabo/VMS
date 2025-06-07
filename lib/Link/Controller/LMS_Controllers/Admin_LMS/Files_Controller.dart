import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Files_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Files_Controller extends GetxController {
  List<LmsCurriculmFiles>? files_LMS;
  List<LmsCurriculmFiles> filtered_files_LMS = [];

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
    List<LmsCurriculmFiles> tempFilteredList = List.from(files_LMS!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (curiculumName != null && curiculumName.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.curriculmFile!.enName == curiculumName ||
            cur.curriculmFile!.name == curiculumName;
      }).toList();
    }

    filtered_files_LMS = tempFilteredList;
    update();
  }

  bool isLoading = true;
  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;

  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.bytes != null) {
      selectedFile.value = result.files.single.bytes;
      fileName.value = result.files.single.name;
      updateFieldError("file", false);
      updateTextFile("Done Selected File".tr);
    }
  }

  void updateHoverFile(bool value) {
    isHoveringFile = value;
    update();
  }

  void updateTextFile(String value) {
    fileStatus = value;
    isHoveringFile = false;
    update();
  }

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

  void SetFiles(LMS_Files_Model files) {
    files_LMS = files.lmsCurriculmFiles;

    filtered_files_LMS = List.from(files_LMS!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }

    if (currindex.isNotEmpty) {
      filtered_files_LMS = filtered_files_LMS.where((emp) {
        return emp.curriculmFile!.name == currindex ||
            emp.curriculmFile!.enName == currindex;
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
  bool IsFileError = false;
  bool iscurrError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'curr':
        iscurrError = newValue;
        break;

      case 'file':
        IsFileError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  void Clearfile() {
    selectedFile.value = null;
    updateHoverFile(false);
    updateTextFile("Click To Add File\nOr\nDrag And Drop File Here".tr);
    updateFieldError("file", true);
    update();
  }

  Rx<DateTime?> homeworkDate = Rx<DateTime?>(null);

  bool Hidden = false;
  updateHid(bool value) {
    Hidden = value;
    update();
  }

  void reset() {
    Hidden = false;
    homeworkDate.value = null;
    selectedFile.value = null;
    dialog_currIndex = "";
    updateTextFile("Click To Add File\nOr\nDrag And Drop File Here".tr);

    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    IsFileError = false;
    update();
  }
}
