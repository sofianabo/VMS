import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';

class DragDrop_Question_Items {
  String? text;
  String? imagePath;
  Uint8List? imageBytes; // إضافة هذا الحقل لتخزين بايتات الصورة
  bool showTextField;

  DragDrop_Question_Items({
    this.text,
    this.imagePath,
    this.imageBytes,
    this.showTextField = false,
  });

  bool get isEmpty =>
      (text == null || text!.isEmpty) &&
      (imagePath == null || imagePath!.isEmpty);
  bool get isText => text != null && text!.isNotEmpty;
  bool get isImage => imagePath != null && imagePath!.isNotEmpty;
}

class DragDrop_Question_Controller extends GetxController {
  String? filterName = '';
  List<Question>? questions;
  List<Question>? filterdQuestions;

  // قوائم الخيارات للقسمين
  final RxList<DragDrop_Question_Items> firstSectionOptions =
      <DragDrop_Question_Items>[].obs;
  final RxList<DragDrop_Question_Items> secondSectionOptions =
      <DragDrop_Question_Items>[].obs;

  void clearFilter() {
    searchByName("");
    update();
  }

  // إضافة زوج جديد من الخيارات
  void addOption() {
    firstSectionOptions.add(DragDrop_Question_Items());
    secondSectionOptions.add(DragDrop_Question_Items());
    update();
  }

  // التحقق من إمكانية إضافة خيار جديد
  bool canAddNewOption() {
    if (firstSectionOptions.isEmpty) return true;

    // لا يمكن إضافة خيار جديد إذا كان آخر خيار في أي قسم فارغًا
    return !firstSectionOptions.last.isEmpty &&
        !secondSectionOptions.last.isEmpty;
  }

  // إزالة زوج من الخيارات
  void removeOption(int index) {
    if (index < firstSectionOptions.length) {
      firstSectionOptions.removeAt(index);
    }
    if (index < secondSectionOptions.length) {
      secondSectionOptions.removeAt(index);
    }
    update();
  }

  void updateFirstSectionText(int index, String text) {
    if (index < firstSectionOptions.length) {
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: text,
        imagePath: null,
        showTextField: text.isEmpty, // يظهر الحقل إذا كان النص فارغاً
      );
      update();
    }
  }

  void toggleTextField(int index, bool isFirstSection) {
    if (isFirstSection) {
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: firstSectionOptions[index].text,
        imagePath: null,
        showTextField: true, // إظهار حقل النص عند الضغط
      );
    } else {
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: secondSectionOptions[index].text,
        imagePath: null,
        showTextField: true, // إظهار حقل النص عند الضغط
      );
    }
    update();
  }

  // تحديث نص السؤال

  // تحديث صورة السؤال
  void updateFirstSectionImage(int index, String imagePath,
      [Uint8List? bytes]) {
    if (index < firstSectionOptions.length) {
      firstSectionOptions[index] = DragDrop_Question_Items(
        text: null,
        imagePath: imagePath,
        imageBytes: bytes,
      );
      update();
    }
  }

  // تحديث نص الإجابة
  void updateSecondSectionText(int index, String text) {
    if (index < secondSectionOptions.length) {
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: text,
        imagePath: null,
        showTextField: text.isEmpty, // يظهر الحقل إذا كان النص فارغاً
      );
      update();
    }
  }

  // تحديث صورة الإجابة
  void updateSecondSectionImage(int index, String imagePath,
      [Uint8List? bytes]) {
    if (index < secondSectionOptions.length) {
      secondSectionOptions[index] = DragDrop_Question_Items(
        text: null,
        imagePath: imagePath,
        imageBytes: bytes,
      );
      update();
    }
  }

  // تنظيف الخيارات الفارغة
  void validateAndCleanOptions() {
    // إزالة الأزواج التي يكون أحد قسميها فارغًا
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

  // التحقق من صحة البيانات قبل الحفظ
  bool validateBeforeSave() {
    // يجب أن يكون هناك زوجان على الأقل
    if (firstSectionOptions.length < 2 || secondSectionOptions.length < 2) {
      ErrorMessage('يجب إدخال زوجين على الأقل'.tr);
      return false;
    }

    // يجب أن يكون عدد العناصر متساويًا في القسمين
    if (firstSectionOptions.length != secondSectionOptions.length) {
      ErrorMessage('يجب أن يتطابق عدد العناصر في القسمين'.tr);
      return false;
    }

    // التحقق من عدم وجود خيارات فارغة
    for (int i = 0; i < firstSectionOptions.length; i++) {
      if (firstSectionOptions[i].isEmpty || secondSectionOptions[i].isEmpty) {
        ErrorMessage('يجب تعبئة جميع الحقول'.tr);
        return false;
      }
    }

    return true;
  }

  // تنظيف البيانات بعد الإضافة
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
