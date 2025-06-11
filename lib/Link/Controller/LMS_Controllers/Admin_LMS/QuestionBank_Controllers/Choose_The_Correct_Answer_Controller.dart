import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';

class Choose_The_Correct_Answer extends GetxController {
  String? filterName = '';

  void clearFilter() {
    // searchByName("", currindex);
    update();
  }

  // إدارة حالة السؤال
  final RxString _question = ''.obs;
  String get question => _question.value;
  set question(String value) => _question.value = value;

  // إدارة حالة الخطأ في السؤال
  final RxBool _isQuestionError = false.obs;

  // قائمة الخيارات
  final RxList<String> _options = <String>[
    "",
  ].obs;
  List<String> get options => _options;

  // الفهرس المحدد كإجابة صحيحة
  final RxInt _correctAnswerIndex = 0.obs;
  int get correctAnswerIndex => _correctAnswerIndex.value;
  set correctAnswerIndex(int value) => _correctAnswerIndex.value = value;

  // إضافة خيار جديد
  void addOption(String option) {
    _options.add(option);
    update();
  }

  bool canAddNewOption() {
    // لا يمكن إضافة خيار جديد إذا كانت القائمة فارغة
    if (_options.isEmpty) return true;

    // التحقق من أن آخر خيار غير فارغ
    return _options.last.trim().isNotEmpty;
  }

  void setCorrectAnswerIndex(int? index) {
    if (index != null) {
      _correctAnswerIndex.value = index;
      update(); // هذا السطر ضروري لتحديث الواجهة
    }
  }

  // تنظيف البيانات بعد الإضافة
  void clearData() {
    _question.value = '';
    _options.clear();
    _correctAnswerIndex.value = -1;
    _isQuestionError.value = false;
    update();
  }

  void removeOption(int index) {
    if (index == _correctAnswerIndex.value) {
      ErrorMessage('لا يمكن حذف الإجابة الصحيحة'.tr);
      return;
    }

    _options.removeAt(index);

    if (_correctAnswerIndex.value > index) {
      _correctAnswerIndex.value--;
    }
    update();
  }

  void validateAndCleanOptions() {
    bool allEmpty = _options.every((option) => option.trim().isEmpty);

    if (allEmpty && _options.isNotEmpty) {
      // إذا كانت جميع الخيارات فارغة
      _options
        ..clear()
        ..add(''); // نترك خيارًا واحدًا فارغًا
      _correctAnswerIndex.value = 0; // نجعله محددًا
      update();
      return;
    }

    // تنظيف الخيارات الفارغة مع الحفاظ على الإجابة الصحيحة
    for (int i = _options.length - 1; i >= 0; i--) {
      if (_options[i].trim().isEmpty && i != _correctAnswerIndex.value) {
        _options.removeAt(i);
        if (_correctAnswerIndex.value > i) {
          _correctAnswerIndex.value--;
        }
      }
    }

    // إذا لم يبق سوى خيار واحد وهو فارغ
    if (_options.length == 1 && _options[0].trim().isEmpty) {
      _correctAnswerIndex.value = 0; // نجعله محددًا
    }

    update();
  }

  bool validateBeforeSave() {
    // التحقق من وجود خيارات كافية
    if (_options.length < 2) {
      ErrorMessage('يجب إدخال خيارين على الأقل'.tr);
      return false;
    }

    // التحقق من تحديد إجابة صحيحة
    if (_correctAnswerIndex.value == -1) {
      ErrorMessage('الرجاء تحديد الإجابة الصحيحة'.tr);
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
    // List<LmsCurriculmUrl> tempFilteredList = List.from(Link_lms!);

    // if (nameQuery != null && nameQuery.isNotEmpty) {
    //   tempFilteredList = tempFilteredList.where((cur) {
    //     final curName = cur.name?.toLowerCase() ?? '';
    //     return curName.contains(nameQuery.toLowerCase());
    //   }).toList();
    // }
    //
    //
    //
    // filtered_Links_LMS = tempFilteredList;
    update();
  }

  bool isLoading = false;

  void SetLinks() {
    // Link_lms = links.lmsCurriculmUrl;
    //
    // filtered_Links_LMS = List.from(Link_lms!);
    //
    // if (filterName != null && filterName!.isNotEmpty) {
    //   searchByName(filterName.toString(), currindex);
    // }
    //

    SetIsLoading(false);
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

      default:
        print("Error: Invalid type");
    }
    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    isLinkError = false;
    update();
  }
}
