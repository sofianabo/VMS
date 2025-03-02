import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';

class RewardsController extends GetxController {
  String selectedImage = "../../images/Certificate/c3.svg";

  // بيانات الشهادات
  List<Map<String, dynamic>> Certificats = [
    {
      "image": "../../images/Certificate/c2.svg",
      "DataPosition": [
        {
          "name": "شهادة امتياز",
          "PositionX": "360.0",
          "PositionY": "29.6",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
        },
        {
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "277.4",
          "PositionY": " 123.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name": "ليث هيثم عزام",
          "PositionX": "325.2",
          "PositionY": "207.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "لتميزه في مادة العلوم",
          "PositionX": "266.8",
          "PositionY": "342.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "286.0",
          "PositionY": "446.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "583.6",
          "PositionY": "534.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c1.svg",
      "DataPosition": [
        {
          "name": "شهادة امتياز",
          "PositionX": " 7.2",
          "PositionY": "388.0",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
        },
        {
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "206.2",
          "PositionY": "138.8",
          "isbold": false,
          "size": 18,
          "color": "0xff000000",
        },
        {
          "name": "ليث هيثم عزام",
          "PositionX": "283.8",
          "PositionY": "227.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "لتميزه في مادة العلوم",
          "PositionX": "238.4",
          "PositionY": "341.2",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "502.8",
          "PositionY": "509.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "633.0",
          "PositionY": "467.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c4.svg",
      "DataPosition": [
        {
          "name": "شهادة امتياز",
          "PositionX": "52.0",
          "PositionY": "412.6",
          "isbold": true,
          "size": 24,
          "color": "0xffFAB23C",
        },
        {
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "257.4",
          "PositionY": " 136.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name": "ليث هيثم عزام",
          "PositionX": "306.2",
          "PositionY": "227.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "لتميزه في مادة العلوم",
          "PositionX": "262.8",
          "PositionY": "350.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "34.8",
          "PositionY": "535.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "78.6",
          "PositionY": "457.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c3.svg",
      "DataPosition": [
        {
          "name": "شهادة امتياز",
          "PositionX": "59.2",
          "PositionY": "333.6",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
        },
        {
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "264.6",
          "PositionY": "102.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name": "ليث هيثم عزام",
          "PositionX": "310.2",
          "PositionY": "219.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "لتميزه في مادة العلوم",
          "PositionX": "254.8",
          "PositionY": "345.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "147.8",
          "PositionY": "489.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "586.6",
          "PositionY": "533.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        }
      ]
    },
    {
      "image": "../../images/Certificate/c5.svg",
      "DataPosition": [
        {
          "name": "شهادة امتياز",
          "PositionX": "70.0",
          "PositionY": "254.6",
          "isbold": true,
          "size": 24,
          "color": "0xff333B99",
        },
        {
          "name": "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
          "PositionX": "255.4",
          "PositionY": " 115.0",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name": "ليث هيثم عزام",
          "PositionX": "304.2",
          "PositionY": "214.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "لتميزه في مادة العلوم",
          "PositionX": "246.8",
          "PositionY": "337.6",
          "isbold": false,
          "size": 36,
          "color": "0xff000000",
        },
        {
          "name": "و نتمنى له دوام التقدم و النجاح",
          "PositionX": "256.8",
          "PositionY": "463.6",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        },
        {
          "name":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "PositionX": "571.6",
          "PositionY": "487.2",
          "isbold": false,
          "size": 16,
          "color": "0xff000000",
        }
      ]
    },
  ];

  List<TextOverlay> textOverlays = [];
  int? selectedTextIndex;

  var progress = 0.0.obs;

  Future<void> selectImage(String image) async {
    if (selectedImage == image) {
      return;
    }
    selectedImage = image;
    textOverlays.clear();
    update();
    await Future.delayed(Duration(milliseconds: 10));
    var selectedCertificate = Certificats.firstWhere(
      (cert) => cert['image'].toString().trim() == image.trim(),
      orElse: () => {},
    );

    for (var data in selectedCertificate['DataPosition']) {
      print('إضافة عنصر: ${data['name']}');
      print('الموقع X: ${data['PositionX']}');
      print('الموقع Y: ${data['PositionY']}');

      // إضافة العنصر باستخدام InitialTextOverlay
      InitialTextOverlay(
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
    update(); // تحديث واجهة المستخدم
  }

  // إضافة نص جديد
  void addTextOverlay() {
    textOverlays.add(TextOverlay(
      text: "New Text".tr,
      position: Offset(100, 100),
      fontSize: 20,
      color: Colors.black,
      isBold: false,
      isSelected: false,
    ));
    update();
  }

  // دالة لإضافة النصوص بناءً على البيانات
  void InitialTextOverlay({
    required String text,
    required Offset position,
    required int size,
    required Color color,
    required bool isbold,
  }) {
    textOverlays.add(TextOverlay(
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
    textOverlays[index] = updatedOverlay;
    update();
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

  // حذف النص
  void deleteText(int index) {
    textOverlays.removeAt(index);
    selectedTextIndex = -1;
    update();
  }
}
