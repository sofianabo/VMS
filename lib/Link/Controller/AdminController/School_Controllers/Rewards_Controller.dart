import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';

class RewardsController extends GetxController {
  String selectedImage = "../../images/Certificate/c3.svg";

  List<Map<String, dynamic>> Certificats = [
    {
      "image": "../../images/Certificate/c2.svg",
      "DataPosition": [
        {
          "islock": true,
          "name": "شهادة امتياز",
          "PositionX": "360.0",
          "PositionY": "29.6",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
          "type": "Cname",
        },
        {
          "islock": false,
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "277.4",
          "PositionY": "123.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name": "ليث هيثم عزام",
          "PositionX": "325.2",
          "PositionY": "207.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "stuname",
        },
        {
          "islock": false,
          "name": "لتميزه في مادة العلوم",
          "PositionX": "266.8",
          "PositionY": "342.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": false,
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "286.0",
          "PositionY": "446.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "583.6",
          "PositionY": "534.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "Date",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c1.svg",
      "DataPosition": [
        {
          "islock": true,
          "name": "شهادة امتياز",
          "PositionX": " 7.2",
          "PositionY": "388.0",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
          "type": "Cname",
        },
        {
          "islock": false,
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "206.2",
          "PositionY": "138.8",
          "isbold": false,
          "size": 18,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name": "ليث هيثم عزام",
          "PositionX": "283.8",
          "PositionY": "227.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "stuname",
        },
        {
          "islock": false,
          "name": "لتميزه في مادة العلوم",
          "PositionX": "238.4",
          "PositionY": "341.2",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": false,
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "502.8",
          "PositionY": "509.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "633.0",
          "PositionY": "467.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "Date",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c4.svg",
      "DataPosition": [
        {
          "islock": true,
          "name": "شهادة امتياز",
          "PositionX": "52.0",
          "PositionY": "412.6",
          "isbold": true,
          "size": 24,
          "color": "0xffFAB23C",
          "type": "Cname",
        },
        {
          "islock": false,
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "257.4",
          "PositionY": " 136.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name": "ليث هيثم عزام",
          "PositionX": "306.2",
          "PositionY": "227.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "stuname",
        },
        {
          "islock": false,
          "name": "لتميزه في مادة العلوم",
          "PositionX": "262.8",
          "PositionY": "350.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": false,
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "34.8",
          "PositionY": "535.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "78.6",
          "PositionY": "457.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "Date",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c3.svg",
      "DataPosition": [
        {
          "islock": true,
          "name": "شهادة امتياز",
          "PositionX": "59.2",
          "PositionY": "333.6",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
          "type": "Cname",
        },
        {
          "islock": false,
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "264.6",
          "PositionY": "102.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name": "ليث هيثم عزام",
          "PositionX": "310.2",
          "PositionY": "219.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "stuname",
        },
        {
          "islock": false,
          "name": "لتميزه في مادة العلوم",
          "PositionX": "254.8",
          "PositionY": "345.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": false,
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "147.8",
          "PositionY": "489.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "UnKnow",
        },
        {
          "islock": true,
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "586.6",
          "PositionY": "533.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
          "type": "Date",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c5.svg",
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
          "name": "لتميزه في مادة العلوم",
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

  List<TextOverlay> textOverlays = [];
  int? selectedTextIndex;

  var progress = 0.0.obs;

  void updateCertificates(
      List<Map<String, dynamic>> certificates, String newName) {
    List<Map<String, dynamic>> updatedCertificates = List.from(certificates);

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

    // التأكد من وجود الشهادة المحددة
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

  // تحديث النص
  void updateTextOverlay(int index, TextOverlay updatedOverlay) {
    if (index >= 0 && index < textOverlays.length) {
      // تعديل العنصر في المصفوفة مباشرة باستخدام الفهرس
      textOverlays[index] = updatedOverlay; // نعدل النص مباشرة
      update(); // تحديث الواجهة بعد التعديل
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

// حذف النص
  void deleteText(int index) {
    // التأكد من إزالة العنصر بشكل صحيح حسب الـ index المحدد
    if (index >= 0 && index < textOverlays.length) {
      textOverlays.removeAt(index); // حذف العنصر بناءً على الـ index
      selectedTextIndex = -1; // إلغاء التحديد
      update(); // تحديث الواجهة بعد الحذف
    }
  }

  // تحديد النص
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

  // إلغاء تحديد النص
  void deselectText() {
    selectedTextIndex = null;
    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }
    update();
  }
}
