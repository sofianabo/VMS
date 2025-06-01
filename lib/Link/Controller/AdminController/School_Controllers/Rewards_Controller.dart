import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsController extends GetxController {
  double fontSize;
  bool isBold;

  RewardsController(this.fontSize, this.isBold);

  setRewards() {
    DialogCertificats.clear();
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
    ];
    selectDialogImage("assets/images/Certificate/c2.svg");
    update();
  }

  void updateStudentName(String newName) {
    // 1. تحديث البيانات الأصلية في DialogCertificats
    updateCertificates(DialogCertificats, newName);

    // 2. مسح جميع الـ overlays الحالية
    textOverlays.clear();

    // 3. إعادة إنشاء جميع الـ overlays من البيانات المحدثة
    var selectedCertificate = DialogCertificats.firstWhere(
      (cert) => cert['image'].toString().trim() == selectedImage.trim(),
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

    // 4. إعادة تعيين الفهرس المحدد
    selectedTextIndex = null;

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

  List<TextOverlay> textOverlays = [];
  int? selectedTextIndex;
  List<Map<String, dynamic>> DialogCertificats = [];
  var progress = 0.0.obs;

  void updateFontSize(double newSize) {
    fontSize = newSize;
    update();
  }

  void toggleBold() {
    isBold = !isBold;
    update();
  }

  String selectedImage = "assets/images/Certificate/c2.svg";

  Future<void> selectDialogImage(String image) async {
    if (selectedImage == image) return;

    // 2. تحديث الصورة المحددة
    selectedImage = image;
    // 3. تحميل البيانات الجديدة مع الحفاظ على التعديلات
    _loadCertificateData(image);

    update();
  }

  void _loadCertificateData(String image) {
    // 1. مسح الـ overlays الحالية
    textOverlays.clear();

    // 2. تحميل البيانات الأصلية للشهادة الجديدة
    var certificate = DialogCertificats.firstWhere(
      (cert) => cert['image'] == image,
      orElse: () => {},
    );

    if (certificate.isNotEmpty) {
      for (var data in certificate['DataPosition']) {
        textOverlays.add(TextOverlay(
          type: data['type'],
          text: data['name'],
          position: Offset(
            double.parse(data['PositionX'].toString()),
            double.parse(data['PositionY'].toString()),
          ),
          fontSize: data['size'].toDouble(),
          color: Color(int.parse(data['color'])),
          isBold: data['isbold'],
          isSelected: false,
        ));
      }
    }
  }

  void addTextOverlay() {
    final newOverlay = TextOverlay(
      type: "UnKnow_${DateTime.now().millisecondsSinceEpoch}", // معرف فريد
      text: "New Text".tr,
      position: Offset(100, 100),
      fontSize: 20,
      color: Colors.black,
      isBold: false,
      isSelected: false,
    );

    textOverlays.add(newOverlay);
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
    if (!textOverlays.any(
        (overlay) => overlay.type == type && overlay.position == position)) {
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
  }

  Timer? _updateTimer;
  void _scheduleCertificateUpdate() {
    _updateTimer?.cancel();
    _updateTimer = Timer(Duration(milliseconds: 1000), () {});
  }

  void updateTextOverlay(int index, TextOverlay updatedOverlay) {
    if (index >= 0 && index < textOverlays.length) {
      // تحديث سريع بدون إعادة بناء كاملة
      textOverlays[index] = updatedOverlay;

      // تأجيل التحديث الكامل للبيانات
      _scheduleCertificateUpdate();
    }
  }

  void deleteSelectedText() {
    if (selectedTextIndex != null &&
        selectedTextIndex! >= 0 &&
        selectedTextIndex! < textOverlays.length) {
      textOverlays.removeAt(selectedTextIndex!);
      selectedTextIndex = null; // إعادة ضبط الفهرس بعد الحذف
      update();
    }
  }

  contup() {
    update();
  }

  void selectText(int index) {
    // إلغاء تحديد جميع العناصر أولاً
    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }

    // تحديد العنصر المطلوب فقط
    if (index >= 0 && index < textOverlays.length) {
      textOverlays[index].isSelected = true;
      selectedTextIndex = index; // حفظ الفهرس المحدد
    }

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

class TextOverlay {
  String text;
  Offset position;
  double fontSize;
  Color color;
  bool isBold;
  bool isSelected;
  String type; // إضافة النوع

  TextOverlay({
    required this.text,
    required this.position,
    required this.fontSize,
    required this.color,
    this.isBold = false,
    this.isSelected = false,
    required this.type, // القيمة الافتراضية
  });
}

class DraggableText extends StatefulWidget {
  final Key key;
  final TextOverlay overlay;
  final Function(TextOverlay) onUpdate;
  final Function onSelect;
  final Function onDelete;
  final bool isSelected;

  const DraggableText({
    required this.key,
    required this.overlay,
    required this.onUpdate,
    required this.onSelect,
    required this.onDelete,
    required this.isSelected,
  }) : super(key: key);

  @override
  _DraggableTextState createState() => _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {
  late Offset position;
  late double fontSize;
  late Color color;
  late bool isBold;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    position = widget.overlay.position;
    fontSize = widget.overlay.fontSize;
    color = widget.overlay.color;
    isBold = widget.overlay.isBold;
    textController = TextEditingController(text: widget.overlay.text);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () => widget.onSelect(),
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
            print(position);
          });
          widget.onUpdate(TextOverlay(
            type: widget.overlay.type, // مرر النوع الحالي هنا
            text: textController.text,
            position: position,
            fontSize: fontSize,
            color: color,
            isBold: isBold,
            isSelected: widget.isSelected,
          ));
        },
        child: Stack(
          children: [
            if (widget.isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Theme.of(context).cardColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: textController,
                          onChanged: (newText) {
                            print(widget.overlay.type);
                            widget.onUpdate(TextOverlay(
                              type: widget.overlay.type, // تمرير النوع الحالي
                              text: newText,
                              position: position,
                              fontSize: fontSize,
                              color: color,
                              isBold: isBold,
                              isSelected: widget.isSelected,
                            ));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "أدخل النص",
                          ),
                        ),
                      ),
                      Slider(
                        min: 10,
                        max: 50,
                        value: fontSize,
                        onChanged: (newSize) {
                          setState(() {
                            fontSize = newSize;
                          });
                          widget.onUpdate(TextOverlay(
                            type: widget.overlay.type, // مرر النوع الحالي
                            text: textController.text,
                            position: position,
                            fontSize: fontSize,
                            color: color,
                            isBold: isBold,
                            isSelected: widget.isSelected,
                          ));
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              widget.onDelete(); // حذف النص عند الضغط
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              isBold
                                  ? Icons.format_bold
                                  : Icons.format_bold_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                isBold = !isBold;
                              });
                              widget.onUpdate(TextOverlay(
                                type: widget.overlay.type, // مرر النوع الحالي
                                text: textController.text,
                                position: position,
                                fontSize: fontSize,
                                color: color,
                                isBold: isBold,
                                isSelected: widget.isSelected,
                              ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                textController.text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
