import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Qustions_Bank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/PagesLmsController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Curriculumn_LMS_Controller extends GetxController {
  List<Curriculum>? curriculum;
  String? filterName = '';
  List<Curriculum> filteredCurriculum = [];
  int? semesterId;
  int? subjectId;

  List<String> selectedSemesterss = [];
  List<int> selectedSemesterIds = [];
  String selectdialog_SemesterIndex = '';

  void clearFilter() {
    searchByName("", semesterIndex, subjectIndex);
    update();
  }

  void searchByName(String? nameQuery, String? semester, String? subject) {
    filterName = nameQuery;
    List<Curriculum> tempFilteredList = List.from(curriculum!);
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curenName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curenName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (semester != null && semester.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.semester!
            .any((s) => s.enName == semester || s.name == semester);
      }).toList();
    }

    if (subject != null && subject.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.subject!.enName == subject || cur.subject!.name == subject;
      }).toList();
    }

    filteredCurriculum = tempFilteredList;
    update();
  }

  bool isFailingSubject = false;
  bool isLoading = true;
  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;
  bool isHoveringimage = false;
  String imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here".tr;

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      selectedImage.value = fileBytes;
      updateFieldError("image", false);
      updateTextImage("Done Selected Image".tr);
    } else {}
  }

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

  void updateHoverImage(bool value) {
    isHoveringimage = value;
    update();
  }

  void updateTextImage(String value) {
    imageStatus = value;
    isHoveringimage = false;
    update();
  }

  void updateTextFile(String value) {
    fileStatus = value;
    isHoveringFile = false;
    update();
  }

  void updateSelection(bool value) {
    isFailingSubject = value;
    update();
  }

  String subjectIndex = "";
  String semesterIndex = "";
  String dialog_SubjectIndex = "";
  String dialog_SemesterIndex = "";

  List<String> listsubject = [];
  List<String> list_Dialog_Subject = [];
  List<String> list_Dialog_semester = [
    "The First Semester".tr,
    "The Second Semester".tr,
    "The Third Semester".tr,
  ];
  List<String> listSemester = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Subject':
        subjectIndex = index ?? "";
        break;
      case 'Dialog_Subject':
        dialog_SubjectIndex = index ?? "";
        break;
      case 'semester':
        semesterIndex = index ?? "";
        break;
      case 'Dialog_semester':
        dialog_SemesterIndex = index ?? "";
        break;
    }
    searchByName(filterName, semesterIndex, subjectIndex);
    update();
  }

  void SetCurriculum(Curriculum_Model curriculumModel) {
    curriculum = curriculumModel.curriculum;

    filteredCurriculum = List.from(curriculum!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), semesterIndex, subjectIndex);
    }

    if (semesterIndex.isNotEmpty) {
      filteredCurriculum = filteredCurriculum.where((emp) {
        return emp.semester?.any(
                (s) => s.name == semesterIndex || s.enName == semesterIndex) ??
            false;
      }).toList();
    }

    if (subjectIndex.isNotEmpty) {
      filteredCurriculum = filteredCurriculum.where((emp) {
        return emp.subject!.name == subjectIndex ||
            emp.subject!.enName == subjectIndex;
      }).toList();
    }

    SetIsLoading(false);
    Get.find<Homeworkcontroller>().setcurr(curriculumModel);
    Get.find<Homeworkcontroller>().setDialogCurr(curriculumModel);
    Get.find<Files_Controller>().setCurriculum(curriculumModel);
    Get.find<LinkslmsController>().setCurriculum(curriculumModel);
    Get.find<Pageslmscontroller>().setCurriculum(curriculumModel);
    Get.find<Qustions_Bank_Controller>().setCurriculum(curriculumModel);
    Get.find<Allquizcontroller>().setCurriculum(curriculumModel);
    Get.find<Allquizcontroller>().setCurriculumialog(curriculumModel);
    update();
  }

  void addlistsubject(List<String> data) {
    listsubject.clear();
    list_Dialog_Subject.clear();
    subjectIndex = "";
    listsubject.addAll(data);
    list_Dialog_Subject.addAll(data);

    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'Subject':
        listsubject = options;
        break;
      case 'Dialog_Subject':
        list_Dialog_Subject = options;
        break;
      case 'semester':
        listSemester = options;
        break;
      case 'Dialog_semester':
        list_Dialog_semester = options;
        break;
    }
    update();
  }

  String get selectsubjectIndex => subjectIndex;

  String get selectsemesterIndex => semesterIndex;

  String get selectdialog_SubjectIndex => dialog_SubjectIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void set_subjectIdx(id) {
    subjectId = id;
    update();
  }

  void set_semesteridx(id) {
    semesterId = id;
    update();
  }

  bool IsAnameError = false;
  bool IsEnameError = false;
  bool IsSubjectError = false;
  bool IsSemesterError = false;
  bool IsMaxError = false;
  bool IsPassingError = false;
  bool IsImageError = false;
  bool IsFileError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'ename':
        IsEnameError = newValue;
        break;
      case 'subject':
        IsSubjectError = newValue;
        break;
      case 'semester':
        IsSemesterError = newValue;
        break;
      case 'max':
        IsMaxError = newValue;
        break;
      case 'passing':
        IsPassingError = newValue;
        break;
      case 'image':
        IsImageError = newValue;
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

  void ClearImage() {
    selectedImage.value = null;
    updateHoverImage(false);
    updateTextImage("Click To Add Image\nOr\nDrag And Drop Image Here".tr);
    updateFieldError("image", true);
    update();
  }

  void initialScreen() {
    subjectIndex = "";
    semesterIndex = "";
    update();
  }

  initialAddCurr() {
    selectedSemesterss = [];
    selectedSemesterIds = [];
    selectdialog_SemesterIndex = '';
    fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;
    imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here".tr;
    dialog_SubjectIndex = "";
    dialog_SemesterIndex = "";
    isFailingSubject = false;
    selectedImage.value = null;
    selectedFile.value = null;
    updateFieldError("aname", false);
    updateFieldError("ename", false);
    updateFieldError("max", false);
    updateFieldError("passing", false);
    updateFieldError("subject", false);
    updateFieldError("semester", false);
    updateFieldError("image", false);
    updateFieldError("file", false);

    update();
  }
}
