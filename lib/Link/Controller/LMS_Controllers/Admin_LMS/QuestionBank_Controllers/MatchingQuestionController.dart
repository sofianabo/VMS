import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';

class Matching_Question_Controller extends GetxController {
  List<String> firstSectionOptions = [];
  List<String> secondSectionOptions = [];
  bool IsAnameError = false;

  void updateFieldError(String field, bool isError) {
    if (field == "aname") {
      IsAnameError = isError;
    }
    update();
  }

  bool canAddNewOption() {
    // يمكن الإضافة إذا كانت القوائم فارغة أو إذا كانت آخر عناصر غير فارغة
    if (firstSectionOptions.isEmpty && secondSectionOptions.isEmpty) return true;
    if (firstSectionOptions.isNotEmpty && 
        firstSectionOptions.last.isNotEmpty && 
        secondSectionOptions.last.isNotEmpty) {
      return true;
    }
    return false;
  }

  void addOption() {
    firstSectionOptions.add('');
    secondSectionOptions.add('');
    update();
  }

  void removeOption(int index) {
    if (index < firstSectionOptions.length) firstSectionOptions.removeAt(index);
    if (index < secondSectionOptions.length) secondSectionOptions.removeAt(index);
    update();
  }

  void validateAndCleanOptions() {
    // إزالة الخيارات الفارغة من كلا القسمين
    for (int i = firstSectionOptions.length - 1; i >= 0; i--) {
      if (firstSectionOptions[i].isEmpty || 
          (i < secondSectionOptions.length && secondSectionOptions[i].isEmpty)) {
        removeOption(i);
      }
    }
  }

  bool validateBeforeSave() {
    if (firstSectionOptions.isEmpty || secondSectionOptions.isEmpty) {
      ErrorMessage("يجب إضافة خيار واحد على الأقل في كل قسم");
      return false;
    }
    return true;
  }
}