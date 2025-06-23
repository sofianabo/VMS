import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MultiChoiseModel.dart';

class Multi_Choice_Picture_Controller extends GetxController {
  String? filterName = '';
  List<Question>? questions;
  List<Question>? filterdQuestions;

  void clearFilter() {
    searchByName("");
    update();
  }

  // قائمة الخيارات
  final RxList<String> _options = <String>[""].obs;
  List<String> get options => _options;

  // قائمة المؤشرات للإجابات الصحيحة
  final RxList<int> _correctAnswersIndices = <int>[].obs;
  List<int> get correctAnswersIndices => _correctAnswersIndices;

  // إضافة خيار جديد
  void addOption(String option) {
    _options.add(option);
    update();
  }

  bool canAddNewOption() {
    if (_options.isEmpty) return true;
    return _options.last.trim().isNotEmpty;
  }

  // إضافة أو إزالة إجابة صحيحة
  void toggleCorrectAnswer(int index) {
    if (_correctAnswersIndices.contains(index)) {
      _correctAnswersIndices.remove(index);
    } else {
      _correctAnswersIndices.add(index);
    }
    _correctAnswersIndices.sort();
    update();
  }

  // تنظيف البيانات بعد الإضافة
  void clearData() {
    _options.value = [""];
    _correctAnswersIndices.clear();
    IsAnameError = false;
  }

  void removeOption(int index) {
    // إزالة الخيار من القائمة
    _options.removeAt(index);

    // تحديث مؤشرات الإجابات الصحيحة
    _correctAnswersIndices.removeWhere((i) => i == index);
    _correctAnswersIndices.value = _correctAnswersIndices.map((i) => i > index ? i - 1 : i).toList().obs;

    update();
  }

  void validateAndCleanOptions() {
    bool allEmpty = _options.every((option) => option.trim().isEmpty);

    if (allEmpty && _options.isNotEmpty) {
      _options
        ..clear()
        ..add('');
      _correctAnswersIndices.clear();
      update();
      return;
    }

    // تنظيف الخيارات الفارغة
    for (int i = _options.length - 1; i >= 0; i--) {
      if (_options[i].trim().isEmpty) {
        _options.removeAt(i);
        _correctAnswersIndices.removeWhere((idx) => idx == i);
        _correctAnswersIndices.value = _correctAnswersIndices.map((idx) => idx > i ? idx - 1 : idx).toList().obs;
      }
    }

    update();
  }

  bool validateBeforeSave() {
    // التحقق من وجود خيارات كافية
    if (_options.length < 2) {
      ErrorMessage('يجب إدخال خيارين على الأقل'.tr);
      return false;
    }

    // التحقق من تحديد إجابة صحيحة واحدة على الأقل
    if (_correctAnswersIndices.isEmpty) {
      ErrorMessage('الرجاء تحديد إجابة صحيحة واحدة على الأقل'.tr);
      return false;
    }

    // التحقق من عدم وجود خيارات فارغة
    for (var option in _options) {
      if (option.trim().isEmpty) {
        ErrorMessage('يجب تعبئة جميع الخيارات'.tr);
        return false;
      }
    }

    return true;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Question> tempFilteredList = List.from(questions!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.description?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filterdQuestions = tempFilteredList;
    update();
  }

  bool isLoading = true;

  void Set_Question(MultiChoiseModel cthc) {
    questions = cthc.question;

    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void Add_Question(Question cthc) {
    questions!.insert(0, cthc);
    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    clearData();
    update();
  }

  void Delete_Question(Question cthc) {
    questions!.remove(cthc);
    filterdQuestions = List.from(questions!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  bool IsAnameError = false;
  bool iscurrError = false;
  bool isLinkError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'linkurl':
        isLinkError = newValue;
        break;
      case 'curr':
        iscurrError = newValue;
        break;
 case 'image':
        IsImageError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    isLinkError = false;
        updateFieldError("image", false);

    update();
  }

    String imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here".tr;
      bool isHoveringimage = false;

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
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
  void updateHoverImage(bool value) {
    isHoveringimage = value;
    update();
  }
   void updateTextImage(String value) {
    imageStatus = value;
    isHoveringimage = false;
    update();
  }
    bool IsImageError = false;
    
  void ClearImage() {
    selectedImage.value = null;
    updateHoverImage(false);
    updateTextImage("Click To Add Image\nOr\nDrag And Drop Image Here".tr);
    updateFieldError("image", true);
    update();
  }
 initialAddCurr() {
    imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here".tr;
    selectedImage.value = null;
 
    updateFieldError("image", false);

    update();
  }
}
