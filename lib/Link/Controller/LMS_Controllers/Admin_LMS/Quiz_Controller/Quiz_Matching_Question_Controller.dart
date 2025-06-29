import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MatchingQuestionModel.dart';

class Quiz_Matching_Question_Controller extends GetxController {
  String? filterName = '';
  List<Question>? questions;
  List<Question>? filterdQuestions;

  // قوائم الخيارات للقسمين
  final RxList<String> firstSectionOptions = <String>[].obs;
  final RxList<String> secondSectionOptions = <String>[].obs;

  void clearFilter() {
    searchByName("");
    update();
  }

  // إضافة زوج جديد من الخيارات
  void addOption() {
    firstSectionOptions.add("");
    secondSectionOptions.add("");
    update();
  }

  // التحقق من إمكانية إضافة خيار جديد
  bool canAddNewOption() {
    if (firstSectionOptions.isEmpty) return true;
    
    // لا يمكن إضافة خيار جديد إذا كان آخر خيار في أي قسم فارغًا
    return firstSectionOptions.last.trim().isNotEmpty && 
           secondSectionOptions.last.trim().isNotEmpty;
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

  // تنظيف الخيارات الفارغة
  void validateAndCleanOptions() {
    // إزالة الأزواج التي يكون أحد قسميها فارغًا
    for (int i = firstSectionOptions.length - 1; i >= 0; i--) {
      if (i >= firstSectionOptions.length || i >= secondSectionOptions.length) {
        continue;
      }
      
      if (firstSectionOptions[i].trim().isEmpty || 
          secondSectionOptions[i].trim().isEmpty) {
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
      if (firstSectionOptions[i].trim().isEmpty || 
          secondSectionOptions[i].trim().isEmpty) {
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

  void setQuestion(MatchingQuestionModel model) {
    questions = model.question;
    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void addQuestion(Question question) {
    questions!.insert(0, question);
    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    clearData();
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