import 'package:get/get.dart';

class IllnessController extends GetxController {
  // استخدام RxList للمتغيرات القابلة للمراقبة
  RxList<Map<String, dynamic>> allIllness = <Map<String, dynamic>>[
    {'id': '1', 'arName': 'مرض 1'},
    {'id': '2', 'arName': 'مرض 2'},
  ].obs;

  RxList<bool> selectedIllness = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    // تهيئة القائمة
    selectedIllness.value = List.generate(allIllness.length, (index) => false);
  }

  void toggleIllness(int index) {
    // استخدام .toggle() للتبديل بشكل أكثر كفاءة
    selectedIllness[index] = !selectedIllness[index];
  }
}
