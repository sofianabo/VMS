import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Functions/Export_Rewards.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';

GlobalKey newRewardsGloballKey = GlobalKey();

Rewards_Dialog({
  required String name,
  required String id,
  required String FileType,
}) {
  final controller = Get.find<RewardsController>();
  return RewardsDialogs_VMS(
    action: [
      ButtonDialog(
          text: "Done".tr,
          onPressed: () async {
            await saveRewardsAsPdf(
                key: newRewardsGloballKey,
                rewardsName: FileType,
                saveLocal: false,
                StuId: id);
          },
          color: Get.theme.primaryColor,
          width: 150),
    ],
    contents: RewardsGrids(name: name),
    apptitle: "Rewards Students".tr,
    subtitle: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "Tools",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ),
        _buildToolButton(
          icon: Icons.text_increase_outlined,
          label: "Add Text",
          onPressed: controller.addTextOverlay,
        ),
        _buildToolButton(
            icon: Icons.picture_as_pdf,
            label: "Export As Pdf",
            onPressed: () async {
              await saveRewardsAsPdf(
                key: newRewardsGloballKey,
                saveLocal: true,
              );
            }),
      ],
    ),
  );
}

GlobalKey RewardsGloballKey = GlobalKey();

class RewardsGrids extends StatefulWidget {
  RewardsGrids({super.key, required this.name});
  String name;
  @override
  State<RewardsGrids> createState() => _RewardsGridsState();
}

class _RewardsGridsState extends State<RewardsGrids> {
  @override
  void initState() {
    final controller = Get.find<RewardsController>();
    if (controller.Certificats.isNotEmpty) {
      controller.selectImage(controller.Certificats.first['image']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RewardsController>(
      init: Get.find<RewardsController>(),
      builder: (controller) {
        controller.updateCertificates(controller.Certificats, widget.name);
        return GestureDetector(
          onTap: controller.deselectText,
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                    color: const Color(0xff134B70),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: controller.Certificats.map((certificate) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectImage(certificate['image']);
                          },
                          child: SvgPicture.asset(
                            certificate['image'],
                            width: 300,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                RepaintBoundary(
                  key: newRewardsGloballKey,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    width: 650,
                    height: 450,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          controller.selectedImage,
                          fit: BoxFit.fitWidth,
                          key: ValueKey(controller.selectedImage),
                        ),
                        for (int i = 0; i < controller.textOverlays.length; i++)
                          DraggableText(
                            onDelete: () => controller.deleteText(i),
                            overlay: controller.textOverlays[i],
                            onUpdate: (updatedOverlay) =>
                                controller.updateTextOverlay(i, updatedOverlay),
                            onSelect: () => controller.selectText(i),
                            isSelected: controller.selectedTextIndex == i,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildToolButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
    child: TextButton(
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            side: BorderSide(color: Get.theme.highlightColor),
          ))),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: Get.theme.highlightColor),
          const SizedBox(width: 6.0),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Get.theme.highlightColor),
          ),
        ],
      ),
    ),
  );
}

class DraggableText extends StatefulWidget {
  final TextOverlay overlay;
  final Function(TextOverlay) onUpdate;
  final Function onSelect;
  final Function onDelete;
  final bool isSelected;

  const DraggableText({
    super.key,
    required this.overlay,
    required this.onUpdate,
    required this.onSelect,
    required this.onDelete,
    required this.isSelected,
  });

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
          });
          widget.onUpdate(TextOverlay(
            type: widget.overlay.type,
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
                              type: widget.overlay.type,
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

Widget RewardsDialogs_VMS({
  required List<Widget> action,
  required Widget contents,
  required String apptitle,
  required Widget subtitle,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    child: AlertDialog(
      actions: action,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(top: 35, left: 35.0, right: 35.0, bottom: 20.0),
      actionsPadding: const EdgeInsets.all(15.0),
      content: contents,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 35.0, top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  apptitle,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2.5),
                ),
                subtitle,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              color: Get.theme.indicatorColor,
              focusColor: Get.theme.indicatorColor,
              hoverColor: Get.theme.indicatorColor,
              splashColor: Get.theme.indicatorColor,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close_rounded,
                  color: Get.theme.secondaryHeaderColor),
            ),
          ),
        ],
      ),
    ),
  );
}
