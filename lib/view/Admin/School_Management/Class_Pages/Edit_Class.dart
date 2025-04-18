import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Edit_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Functions/Class_Curriculm_Funcation.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Edit_Class extends StatefulWidget {
  Edit_Class(
      {required this.id,
      required this.username,
      required this.year,
      required this.arName,
      required this.enName,
      required this.driveUrl,
      super.key});
  String arName;
  String enName;
  String driveUrl;
  String username;
  String year;
  int id;
  @override
  State<Edit_Class> createState() => _Edit_ClassState();
}

class _Edit_ClassState extends State<Edit_Class> {
  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();
  @override
  void initState() {
    arName.text = widget.arName;
    enName.text = widget.enName;
    driveUrl.text = widget.driveUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ClassMgmtController>(builder: (controllers) {
      return VMSAlertDialog(
        action: [
          ButtonDialog(
            text: "Edit".tr,
            onPressed: () async {
              bool isArNameEmpty = arName.text.trim().isEmpty;
              bool isEnNameEmpty = enName.text.isEmpty;
              bool isDriveEmpty = driveUrl.text.trim().isEmpty;

              controllers.updateFieldError("arname", isArNameEmpty);
              controllers.updateFieldError("enname", isEnNameEmpty);
              controllers.updateFieldError("drive", isDriveEmpty);

              if (!(isArNameEmpty || isEnNameEmpty || isDriveEmpty)) {
                await Edit_Class_API(context).Edit_Class(
                  name: arName.text,
                  enName: enName.text,
                  driveUrl: driveUrl.text,
                  classId: widget.id,
                  curriculum: controllers.selectedCurriculums,
                );
                Get.back();
              }
            },
            color: Theme.of(context).primaryColor,
            width: 120,
          ),
        ],
        contents: Container(
          width: 530,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Textfildwithupper(
                      isError: controllers.IsEnnameError,
                      isRequired: true,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controllers.updateFieldError("enname", false);
                        }
                      },
                      width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                      controller: enName,
                      Uptext: "Class En - Name".tr,
                      hinttext: "Class En - Name".tr,
                    ),
                    Textfildwithupper(
                      isError: controllers.IsArnameError,
                      isRequired: true,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controllers.updateFieldError("arname", false);
                        }
                      },
                      width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                      controller: arName,
                      Uptext: "Class Ar - Name".tr,
                      hinttext: "Class Ar - Name".tr,
                    ),
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Textfildwithupper(
                      width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                      controller:
                          TextEditingController(text: "${widget.enName}"),
                      Uptext: "Grade".tr,
                      hinttext: "Grade".tr,
                      readOnly: true,
                    ),
                    Textfildwithupper(
                      width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                      controller: TextEditingController(text: "${widget.year}"),
                      Uptext: "Session".tr,
                      hinttext: "Session".tr,
                      readOnly: true,
                    ),
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Textfildwithupper(
                      width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                      controller:
                          TextEditingController(text: "${widget.username}"),
                      Uptext: "Admin Account".tr,
                      hinttext: "Admin Account".tr,
                      readOnly: true,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text("Curriculums".tr),
                        ),
                        GestureDetector(
                          onTap: () => Class_Curriculm_Funcation(context),
                          child: Container(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            width: screenWidth >= 574 ? 250 : screenWidth * 0.8,
                            height: 40,
                            decoration: controllers.IscurrError
                                ? BoxDecoration(
                                    border: Border.all(
                                      color: Colors
                                          .red, // تغيير لون الحدود حسب حالة الخطأ
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  )
                                : BoxDecoration(
                                    border: Border.all(
                                      color: Color(
                                          0xffB3B3B3), // تغيير لون الحدود حسب حالة الخطأ
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetBuilder<ClassMgmtController>(
                                    builder: (controller) {
                                  return Expanded(
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      controller.selectedCurriculumNames
                                              .isNotEmpty
                                          ? Get.find<ClassMgmtController>()
                                              .selectedCurriculumNames
                                              .join(', ')
                                          : 'No selected curriculum'
                                              .tr, // هنا نعرض رسالة "لا يوجد مناهج مختارة" إذا كانت القائمة فارغة.
                                    ),
                                  );
                                }),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Textfildwithupper(
                      isError: controllers.IsDriveError,
                      isRequired: true,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controllers.updateFieldError("drive", false);
                        }
                      },
                      width: screenWidth >= 574 ? 480 : screenWidth * 0.70,
                      controller: driveUrl,
                      Uptext: "Drive URL".tr,
                      hinttext: "Drive URL".tr,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: SvgPicture.asset(
                        "assets/images/drive.svg",
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        apptitle: "Edit Class".tr,
        subtitle: "none",
      );
    });
  }
}
