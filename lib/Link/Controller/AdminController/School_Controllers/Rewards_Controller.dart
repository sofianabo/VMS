import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';

class RewardsController extends GetxController {
  double fontSize;
  bool isBold;

  RewardsController(this.fontSize, this.isBold);

  void updateFontSize(double newSize) {
    fontSize = newSize;
    update();
  }

  void toggleBold() {
    isBold = !isBold;
    update();
  }

  String selectedImage = "assets/images/Certificate/c3.svg";

  List<Map<String, dynamic>> Certificats = [];
  List<Map<String, dynamic>> DialogCertificats = [];

  setRewards() {
    DialogCertificats.clear();
    Certificats.clear();

    DialogCertificats = [
      {
        "image": "assets/images/Certificate/c2.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "540.0",
            "PositionY": "227.6",
            "isbold": true,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "225.4",
            "PositionY": "56.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "281.8",
            "PositionY": "178.0",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "275.8",
            "PositionY": "272.6",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "263.8",
            "PositionY": "301.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "518.1",
            "PositionY": "394.6",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c1.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "9.5",
            "PositionY": "225.2",
            "isbold": true,
            "size": 14,
            "color": "0xff1B2E50",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "156.4",
            "PositionY": "52.7",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "220.8",
            "PositionY": "174.0",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "214.2",
            "PositionY": "271.0",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "202.1",
            "PositionY": "297.7",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "400.4",
            "PositionY": "397.8",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c4.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "532.6",
            "PositionY": "230.0",
            "isbold": true,
            "size": 14,
            "color": "0xff1B2E50",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "180.4",
            "PositionY": "83.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "245.4",
            "PositionY": "184.1",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "229.3",
            "PositionY": "275.7",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "214.1",
            "PositionY": "302.4",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "462.8",
            "PositionY": "369.0",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c3.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة ذهبية",
            "PositionX": "540.0",
            "PositionY": "227.6",
            "isbold": true,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "225.4",
            "PositionY": "56.0",
            "isbold": false,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "281.8",
            "PositionY": "178.0",
            "isbold": true,
            "size": 24,
            "color": "0xffCEAD6A",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "275.8",
            "PositionY": "272.6",
            "isbold": false,
            "size": 16,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "263.8",
            "PositionY": "301.0",
            "isbold": false,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "518.1",
            "PositionY": "394.6",
            "isbold": false,
            "size": 12,
            "color": "0xffCEAD6A",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c5.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "70.0",
            "PositionY": "254.6",
            "isbold": true,
            "size": 24,
            "color": "0xff333B99",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "255.4",
            "PositionY": " 115.0",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "304.2",
            "PositionY": "214.6",
            "isbold": false,
            "size": 36,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "246.8",
            "PositionY": "337.6",
            "isbold": false,
            "size": 36,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "256.8",
            "PositionY": "463.6",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "571.6",
            "PositionY": "487.2",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
    ];
    Certificats = [
      {
        "image": "assets/images/Certificate/c2.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "540.0",
            "PositionY": "227.6",
            "isbold": true,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "225.4",
            "PositionY": "56.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "281.8",
            "PositionY": "178.0",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "275.8",
            "PositionY": "272.6",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "263.8",
            "PositionY": "301.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "518.1",
            "PositionY": "394.6",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c1.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "9.5",
            "PositionY": "225.2",
            "isbold": true,
            "size": 14,
            "color": "0xff1B2E50",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "156.4",
            "PositionY": "52.7",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "220.8",
            "PositionY": "174.0",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "214.2",
            "PositionY": "271.0",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "202.1",
            "PositionY": "297.7",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "400.4",
            "PositionY": "397.8",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c4.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "532.6",
            "PositionY": "230.0",
            "isbold": true,
            "size": 14,
            "color": "0xff1B2E50",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "180.4",
            "PositionY": "83.0",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "245.4",
            "PositionY": "184.1",
            "isbold": false,
            "size": 24,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "229.3",
            "PositionY": "275.7",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "214.1",
            "PositionY": "302.4",
            "isbold": false,
            "size": 14,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "462.8",
            "PositionY": "369.0",
            "isbold": false,
            "size": 12,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c3.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة ذهبية",
            "PositionX": "540.0",
            "PositionY": "227.6",
            "isbold": true,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "225.4",
            "PositionY": "56.0",
            "isbold": false,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "281.8",
            "PositionY": "178.0",
            "isbold": true,
            "size": 24,
            "color": "0xffCEAD6A",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "275.8",
            "PositionY": "272.6",
            "isbold": false,
            "size": 16,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "263.8",
            "PositionY": "301.0",
            "isbold": false,
            "size": 14,
            "color": "0xffCEAD6A",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "518.1",
            "PositionY": "394.6",
            "isbold": false,
            "size": 12,
            "color": "0xffCEAD6A",
            "type": "Date",
          }
        ]
      },
      {
        "image": "assets/images/Certificate/c5.svg",
        "DataPosition": [
          {
            "islock": true,
            "name": "شهادة امتياز",
            "PositionX": "70.0",
            "PositionY": "254.6",
            "isbold": true,
            "size": 24,
            "color": "0xff333B99",
            "type": "Cname",
          },
          {
            "islock": false,
            "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
            "PositionX": "255.4",
            "PositionY": " 115.0",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name": "ليث هيثم عزام",
            "PositionX": "304.2",
            "PositionY": "214.6",
            "isbold": false,
            "size": 36,
            "color": "0xff000000",
            "type": "stuname",
          },
          {
            "islock": false,
            "name": "لتميزه في جميع المواد",
            "PositionX": "246.8",
            "PositionY": "337.6",
            "isbold": false,
            "size": 36,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": false,
            "name": "و نتمنى له دوام التقدم و النجاح",
            "PositionX": "256.8",
            "PositionY": "463.6",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "UnKnow",
          },
          {
            "islock": true,
            "name":
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "PositionX": "571.6",
            "PositionY": "487.2",
            "isbold": false,
            "size": 16,
            "color": "0xff000000",
            "type": "Date",
          }
        ]
      },
    ];
    selectDialogImage("assets/images/Certificate/c2.svg");
    update();
  }

  List<TextOverlay> textOverlays = [];
  int? selectedTextIndex;

  var progress = 0.0.obs;

  Future<void> selectDialogImage(String image) async {
    if (selectedImage == image) {
      return;
    }
    textOverlays.clear();
    selectedImage = image;
    textOverlays.clear();
    textOverlays.clear();
    update();

    await Future.delayed(Duration(milliseconds: 10));

    var selectedCertificate = DialogCertificats.firstWhere(
      (cert) => cert['image'].toString().trim() == image.trim(),
      orElse: () => {},
    );

    if (selectedCertificate.isNotEmpty) {
      var dataPositionList = selectedCertificate['DataPosition'];

      for (var data in dataPositionList) {
        InitialTextOverlay(
          type: data['type'],
          text: data['name'],
          position: Offset(
            double.parse(data['PositionX'].toString().trim()),
            double.parse(data['PositionY'].toString().trim()),
          ),
          size: data['size'],
          color: Color(int.parse(data['color'])),
          isbold: data['isbold'],
        );
      }
    }

    update();
  }

  void updateCertificates(
      List<Map<String, dynamic>> certificates, String newName) {
    List<Map<String, dynamic>> updatedCertificates =
        List.from(DialogCertificats);

    for (var certificate in updatedCertificates) {
      for (var data in certificate['DataPosition']) {
        if (data['type'] == "stuname") {
          data['name'] = newName;
        }
      }
    }
  }

  Future<void> selectImage(String image) async {
    if (selectedImage == image) {
      return;
    }
    selectedImage = image;
    textOverlays.clear();
    textOverlays.clear();
    update();

    await Future.delayed(Duration(milliseconds: 10));

    var selectedCertificate = Certificats.firstWhere(
      (cert) => cert['image'].toString().trim() == image.trim(),
      orElse: () => {},
    );

    if (selectedCertificate.isNotEmpty) {
      var dataPositionList = selectedCertificate['DataPosition'];

      // إضافة النصوص في النصوص الجديدة
      for (var data in dataPositionList) {
        InitialTextOverlay(
          type: data['type'],
          text: data['name'],
          position: Offset(
            double.parse(data['PositionX'].toString().trim()),
            double.parse(data['PositionY'].toString().trim()),
          ),
          size: data['size'],
          color: Color(int.parse(data['color'])),
          isbold: data['isbold'],
        );
      }
    }

    update(); // تحديث الواجهة بعد إضافة النصوص
  }

  void addTextOverlay() {
    textOverlays.add(TextOverlay(
      type: "UnKnow",
      text: "New Text".tr,
      position: Offset(100, 100),
      fontSize: 20,
      color: Colors.black,
      isBold: false,
      isSelected: false,
    ));
    update();
  }

  void InitialTextOverlay({
    required String text,
    required Offset position,
    required int size,
    required Color color,
    required bool isbold,
    required String type,
  }) {
    textOverlays.add(TextOverlay(
      type: type,
      text: text,
      position: position,
      fontSize: size.toDouble(),
      color: color,
      isBold: isbold,
      isSelected: false,
    ));
    update();
  }

  void updateTextOverlay(int index, TextOverlay updatedOverlay) {
    if (index >= 0 && index < textOverlays.length) {
      textOverlays[index] = updatedOverlay;
      update();
    }
  }

  void saveChanges() {
    var selectedCertificate = Certificats.firstWhere(
      (cert) => cert['image'].toString().trim() == selectedImage.trim(),
      orElse: () => {},
    );

    if (selectedCertificate.isNotEmpty) {
      var dataPositionList = selectedCertificate['DataPosition'];

      // مقارنة البيانات في DataPosition مع textOverlays
      for (int i = 0; i < dataPositionList.length; i++) {
        var data = dataPositionList[i];
        var updatedOverlay = textOverlays.firstWhere(
          (overlay) => overlay.text == data['name'],
          orElse: () => TextOverlay(
            text: '',
            position: Offset.zero,
            fontSize: 16,
            color: Colors.black,
            isBold: false,
            type: 'unKnow', // يجب توفير النوع المناسب هنا
          ),
        );

        if (updatedOverlay != null) {
          bool isUpdated = false;

          // مقارنة النصوص وبيانات أخرى
          if (data['name'] != updatedOverlay.text) {
            data['name'] = updatedOverlay.text;
            isUpdated = true;
          }
          if (data['PositionX'] != updatedOverlay.position.dx.toString()) {
            data['PositionX'] = updatedOverlay.position.dx.toString();
            isUpdated = true;
          }
          if (data['PositionY'] != updatedOverlay.position.dy.toString()) {
            data['PositionY'] = updatedOverlay.position.dy.toString();
            isUpdated = true;
          }
          if (data['size'] != updatedOverlay.fontSize.toInt()) {
            data['size'] = updatedOverlay.fontSize.toInt();
            isUpdated = true;
          }
          if (data['color'] !=
              "0x${updatedOverlay.color.value.toRadixString(16).padLeft(8, '0')}") {
            data['color'] =
                "0x${updatedOverlay.color.value.toRadixString(16).padLeft(8, '0')}";
            isUpdated = true;
          }
          if (data['isbold'] != updatedOverlay.isBold) {
            data['isbold'] = updatedOverlay.isBold;
            isUpdated = true;
          }

          // إذا تم تعديل النص أو أي بيانات أخرى، نقوم بتحديث العنصر
          if (isUpdated) {
            dataPositionList[i] = data;
          }
        }
      }
    }

    update(); // تحديث الواجهة بعد الحفظ
  }

  void deleteText(int index) {
    // التأكد من إزالة العنصر بشكل صحيح حسب الـ index المحدد
    if (index >= 0 && index < textOverlays.length) {
      textOverlays.removeAt(index); // حذف العنصر بناءً على الـ index
      selectedTextIndex = -1; // إلغاء التحديد
      update(); // تحديث الواجهة بعد الحذف
    }
  }

  void selectText(int index) {
    selectedTextIndex = index;

    TextOverlay selectedOverlay = textOverlays.removeAt(index);
    textOverlays.insert(0, selectedOverlay);

    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }
    textOverlays[0].isSelected = true;
    update();
  }

  void deselectText() {
    selectedTextIndex = null;
    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }
    update();
  }
}
