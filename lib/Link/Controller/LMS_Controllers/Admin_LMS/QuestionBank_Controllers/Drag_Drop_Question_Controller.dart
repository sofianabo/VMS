import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';

class DragDrop_Question_Items {
  String? text;
  String? imagePath;
  Uint8List? imageBytes;
  bool isTextSelected; // إضافة حقل لتتبع حالة اختيار النص
  bool isImageSelected; // إضافة حقل لتتبع حالة اختيار الصورة
  bool showTextField;

  DragDrop_Question_Items({
    this.text,
    this.imagePath,
    this.imageBytes,
    this.isTextSelected = false,
    this.isImageSelected = false,
    this.showTextField = false,
  });

  bool get isEmpty =>
      (text == null || text!.isEmpty) &&
      (imagePath == null || imagePath!.isEmpty);
  bool get isText => isTextSelected && text != null;
  bool get isImage => isImageSelected && imagePath != null;
}

class DragDrop_Question_Controller extends GetxController {
  String? filterName = '';
  List<Question>? questions;
  List<Question>? filterdQuestions;

  final RxList<DragDrop_Question_Items> firstSectionOptions =
      <DragDrop_Question_Items>[].obs;
  final RxList<DragDrop_Question_Items> secondSectionOptions =
      <DragDrop_Question_Items>[].obs;

  void clearFilter() {
    searchByName("");
    update();
  }

  void addOption() {
    firstSectionOptions.add(DragDrop_Question_Items());
    secondSectionOptions.add(DragDrop_Question_Items());
    update();
  }

  bool canAddNewOption() {
    if (firstSectionOptions.isEmpty) return true;
    return !firstSectionOptions.last.isEmpty &&
        !secondSectionOptions.last.isEmpty;
  }

  void removeOption(int index) {
    if (index < firstSectionOptions.length) {
      firstSectionOptions.removeAt(index);
    }
    if (index < secondSectionOptions.length) {
      secondSectionOptions.removeAt(index);
    }
    update();
  }

  // تعديل دالة تحديث النص للحفاظ على حالة الاختيار
  void updateFirstSectionText(int index, String text) {
    if (index < firstSectionOptions.length) {
      var currentOption = firstSectionOptions[index];
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: text,
        imagePath: currentOption.imagePath,
        imageBytes: currentOption.imageBytes,
        isTextSelected: true, // التأكد من بقاء النص محددًا
        isImageSelected: false,
        showTextField: true,
      );
      update();
    }
  }

  // تعديل دالة التبديل لتحديد النص أو الصورة
  void toggleTextField(int index, bool isFirstSection) {
    if (isFirstSection) {
      var currentOption = firstSectionOptions[index];
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: currentOption.text,
        imagePath: currentOption.imagePath,
        imageBytes: currentOption.imageBytes,
        isTextSelected: true, // تحديد خيار النص
        isImageSelected: false, // إلغاء تحديد خيار الصورة
        showTextField: true,
      );
    } else {
      var currentOption = secondSectionOptions[index];
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: currentOption.text,
        imagePath: currentOption.imagePath,
        imageBytes: currentOption.imageBytes,
        isTextSelected: true, // تحديد خيار النص
        isImageSelected: false, // إلغاء تحديد خيار الصورة
        showTextField: true,
      );
    }
    update();
  }

  // تعديل دالة تحديث الصورة للحفاظ على حالة الاختيار
  void updateFirstSectionImage(int index, String imagePath,
      [Uint8List? bytes]) {
    if (index < firstSectionOptions.length) {
      var currentOption = firstSectionOptions[index];
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: currentOption.text,
        imagePath: imagePath,
        imageBytes: bytes,
        isTextSelected: false, // إلغاء تحديد خيار النص
        isImageSelected: true, // تحديد خيار الصورة
        showTextField: false,
      );
      update();
    }
  }

  void updateSecondSectionText(int index, String text) {
    if (index < secondSectionOptions.length) {
      var currentOption = secondSectionOptions[index];
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: text,
        imagePath: currentOption.imagePath,
        imageBytes: currentOption.imageBytes,
        isTextSelected: true, // التأكد من بقاء النص محددًا
        isImageSelected: false,
        showTextField: true,
      );
      update();
    }
  }

  void updateSecondSectionImage(int index, String imagePath,
      [Uint8List? bytes]) {
    if (index < secondSectionOptions.length) {
      var currentOption = secondSectionOptions[index];
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: currentOption.text,
        imagePath: imagePath,
        imageBytes: bytes,
        isTextSelected: false, // إلغاء تحديد خيار النص
        isImageSelected: true, // تحديد خيار الصورة
        showTextField: false,
      );
      update();
    }
  }

  void validateAndCleanOptions() {
    for (int i = firstSectionOptions.length - 1; i >= 0; i--) {
      if (i >= firstSectionOptions.length || i >= secondSectionOptions.length) {
        continue;
      }

      if (firstSectionOptions[i].isEmpty || secondSectionOptions[i].isEmpty) {
        firstSectionOptions.removeAt(i);
        secondSectionOptions.removeAt(i);
      }
    }
    update();
  }

  bool validateBeforeSave() {
    if (firstSectionOptions.length < 2 || secondSectionOptions.length < 2) {
      ErrorMessage('يجب إدخال زوجين على الأقل'.tr);
      return false;
    }

    if (firstSectionOptions.length != secondSectionOptions.length) {
      ErrorMessage('يجب أن يتطابق عدد العناصر في القسمين'.tr);
      return false;
    }

    for (int i = 0; i < firstSectionOptions.length; i++) {
      if (firstSectionOptions[i].isEmpty || secondSectionOptions[i].isEmpty) {
        ErrorMessage('يجب تعبئة جميع الحقول'.tr);
        return false;
      }
    }

    return true;
  }

  void clearData() {
    firstSectionOptions.clear();
    secondSectionOptions.clear();
    IsAnameError = false;
    update();
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

  void setQuestion(DragDrop_Question_Model model) {
    questions = model.question;
    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void addQuestion(Question question) {
    questions?.insert(0, question);
    filterdQuestions = List.from(questions ?? []);
    update();
  }

  void deleteQuestion(Question question) {
    questions!.remove(question);
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

  void updateFieldError(String type, bool newValue) {
    if (type == 'aname') {
      IsAnameError = newValue;
    }
    update();
  }

  void resetError() {
    IsAnameError = false;
    update();
  }

  void resetAllFields() {
    firstSectionOptions.clear();
    secondSectionOptions.clear();
    IsAnameError = false;
    update();
  }
}
