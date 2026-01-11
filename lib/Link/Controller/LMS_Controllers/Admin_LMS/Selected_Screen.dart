import 'dart:async';

import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/NumberOfContentController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/StudentLMSController.dart/MainPageContentController.dart';
import 'package:vms_school/main.dart';

class Selected_Class_Controller extends GetxController {
  List<String> moveMenu = [];
  int? classid;
  int? divisionid;

  Timer? timeing;
  var remainingSeconds = 0.obs;

  static const _expiryKey = "session_expiry";
  static const _session_teacherid = "_session_teacherid";
  static const _session_imageid = "_session_imageid";
  static const _session_fullname = "_session_fullname";

  int? teacherid;
  int? imageid;
  String? fullname;

  @override
  void onInit() {
    final teacherIdStr = prefs!.getString(_session_teacherid);
    teacherid = teacherIdStr != null ? int.tryParse(teacherIdStr) : null;
    final imageidStr = prefs!.getString(_session_imageid);
    imageid = imageidStr != null ? int.tryParse(imageidStr) : null;
    fullname = prefs!.getString(_session_fullname);
    loadSession();
    super.onInit();
  }

  void setTeacherData({
    int? teacherId,
    int? imageId,
    String? fullName,
  }) {
    teacherid = teacherId;
    this.imageid = imageId;
    fullname = fullName;
    prefs!.setString(_session_teacherid, "$teacherId");
    prefs!.setString(_session_imageid, "$imageId");
    prefs!.setString(_session_fullname, "$fullName");
    update();
  }

  // بدء جلسة جديدة
  Future<void> startTimer({int durationSeconds = 3600}) async {
    final expiry = DateTime.now().add(Duration(seconds: durationSeconds));
    await _saveExpiry(expiry);
    _startCountdown(expiry);
  }

  // تمديد الجلسة
  Future<void> extendTime(int seconds) async {
    final expiry = await _getExpiry();
    if (expiry != null) {
      final newExpiry = expiry.add(Duration(seconds: seconds));
      await _saveExpiry(newExpiry);
      _startCountdown(newExpiry);
    }
  }

  // تحميل الجلسة عند فتح الصفحة
  Future<void> loadSession() async {
    final expiry = await _getExpiry();
    if (expiry != null) {
      if (expiry.isAfter(DateTime.now())) {
        _startCountdown(expiry);
      } else {
        logoutUser();
      }
    }
  }

  void _startCountdown(DateTime expiry) {
    timeing?.cancel();
    _updateRemaining(expiry);

    timeing = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemaining(expiry);
      if (remainingSeconds.value <= 0) {
        timer.cancel();
        logoutUser();
      }
    });
  }

  void _updateRemaining(DateTime expiry) {
    final diff = expiry.difference(DateTime.now()).inSeconds;
    remainingSeconds.value = diff > 0 ? diff : 0;
  }

  Future<void> _saveExpiry(DateTime expiry) async {
    await prefs!.setString(_expiryKey, expiry.toIso8601String());
  }

  Future<DateTime?> _getExpiry() async {
    final str = prefs!.getString(_expiryKey);
    if (str != null) {
      return DateTime.tryParse(str);
    }
    return null;
  }

  void logoutUser() async {
    print("🚪 تسجيل الخروج التلقائي");
    teacherid = null;
    imageid = null;
    fullname = null;
    await prefs!.remove(_expiryKey);
    await prefs!.remove(_session_teacherid);
    await prefs!.remove(_session_imageid);
    await prefs!.remove(_session_fullname);
    update();
    // هنا ضيف منطق تسجيل الخروج
  }

  @override
  void onClose() {
    timeing?.cancel();
    super.onClose();
  }

  initialinClass(String value, int id) {
    moveMenu = [];
    moveMenu.add(value);
    classid = id;
    update();
  }

  void addToPath(String value) {
    final existingIndex = moveMenu.indexOf(value);
    if (existingIndex != -1) {
      moveMenu = moveMenu.sublist(0, existingIndex + 1);
    } else {
      moveMenu.add(value);
    }
    update();
  }

  // عند الضغط على عنصر: نمسح كل ما بعده
  void onItemTap(int index) {
    moveMenu = moveMenu.sublist(0, index + 1);
    update();
    print('المسار الحالي: ${moveMenu.join(" / ")}');
  }

  var controller = Get.find<Numberofcontentcontroller>();
  var controllerstu = Get.find<Mainpagecontentcontroller>();

  var dataList = <Map<String, dynamic>>[].obs;

  SetDataList(List<Map<String, dynamic>> data) {
    dataList.value = [];
    dataList.addAll(data);
    setIsLoading(false);
    update();
  }

  bool isLoading = false;

  setIsLoading(bool val) {
    isLoading = val;
    update();
  }
}
