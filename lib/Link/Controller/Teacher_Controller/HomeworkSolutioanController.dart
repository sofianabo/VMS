import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeWorkLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/HomeworkSolutionModel.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Homeworksolutioancontroller extends GetxController {
  List<HomeworkeSolution>? homework;
  List<HomeworkeSolution> filteredhomework = [];

  String? filterName = '';
  List<String> currList = [];
  String currindex = "";
  String dialog_currIndex = "";
  List<String> dialogCurrList = [];

  bool isLoading = true;
  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;

  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpeg', 'jpg'],
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

  setcurr(Curriculum_Model currmodel) {
    currList.clear();
    for (int i = 0; i < currmodel.curriculum!.length; i++) {
      currList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? currmodel.curriculum![i].name!
              : currmodel.curriculum![i].enName!);
    }
    updateList("curriculum", currList);
    setisCurriculmLoading(false);
    update();
  }

  setDialogCurr(Curriculum_Model currdialog) {
    dialogCurrList.clear();
    for (int i = 0; i < currdialog.curriculum!.length; i++) {
      dialogCurrList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? currdialog.curriculum![i].name!
              : currdialog.curriculum![i].enName!);
    }
    updateList("currDialog", dialogCurrList);
    setisCurriculmDialogLoading(false);

    update();
  }

  void SetHomework(HomeworkSolutionModel homeworlmodel) {
    homework = homeworlmodel.homeworkeSolution;

    filteredhomework = List.from(homework!);

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
  Rx<DateTime?> get selectDate => homeworkDate;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  bool IsAnameError = false;
  bool isDateError = false;
  bool IsFileError = false;
  bool iscurrError = false;
  bool IsMarkError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'birth':
        isDateError = newValue;
        break;
      case 'curr':
        iscurrError = newValue;
        break;
      case 'mark':
        IsMarkError = newValue;
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
  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: homeworkDate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(
          DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
    );
    if (picked != null) {
      homeworkDate.value = picked;
      updateFieldError("birth", false);
    }
  }

  void reset() {
    homeworkDate.value = null;
    selectedFile.value = null;
    dialog_currIndex = "";
    updateTextFile("Click To Add File\nOr\nDrag And Drop File Here".tr);

    update();
  }

  void resetError() {
    IsAnameError = false;
    isDateError = false;
    iscurrError = false;
    IsFileError = false;
    update();
  }
}
