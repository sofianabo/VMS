import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/UpdateStudentsIllness.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../Model/AdminModel/School_Models/Illness_Model.dart';

class StudentsIllnessDialog extends StatefulWidget {
  final String id;
  final int? indexOfStudent;

  const StudentsIllnessDialog({
    Key? key,
    required this.id,
    this.indexOfStudent,
  }) : super(key: key);

  @override
  _StudentsIllnessDialogState createState() => _StudentsIllnessDialogState();
}

class _StudentsIllnessDialogState extends State<StudentsIllnessDialog> {
  final TextEditingController search = TextEditingController();
  late Illness_Controller control;

  @override
  void initState() {
    super.initState();
    control = Get.find<Illness_Controller>();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth * 0.5; // 80% من عرض الشاشة
        final contentWidth = dialogWidth - 50; // مع هامش 50 للبادنج

        return VMSAlertDialog(
          action: [
            ButtonDialog(
              text: "Done".tr,
              onPressed: () {
                control.SetFinalList();
                Update_Students_Illness_API().Update_Students_Illness(
                  id: widget.id,
                  illness: control.finalList,
                );
              },
              color: Get.theme.primaryColor,
              width: 65,
            )
          ],
          contents: Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: SizedBox(
              width: dialogWidth,
              child: GetBuilder<Illness_Controller>(
                builder: (control) {
                  List<Illness> filteredList = control.isSelectedOnly
                      ? control.filteredIllness!
                          .where((illness) => control.isSelected(illness))
                          .toList()
                      : control.filteredIllness!;

                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormSearch(
                              click: () => control.clearFilter(),
                              onchange: (value) => control.searchByName(value),
                              width: dialogWidth - 8, // مع هامش 20
                              radius: 5,
                              controller: search,
                              suffixIcon: search.text.isNotEmpty
                                  ? Icons.close
                                  : Icons.search,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: control.isSelectedOnly,
                              onChanged: (value) {
                                control.SetisSelectedOnly(value!);
                              },
                            ),
                            Text('Show only selected items'.tr),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _getCrossAxisCount(
                                MediaQuery.of(context).size.width),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.9,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final illness = filteredList[index];
                            final isSelected = control.isSelected(illness);
                            final hasOldFile = control.finalList.any((entry) =>
                                entry['id'] == illness.id &&
                                entry.containsKey('hasOldFile') &&
                                entry['hasOldFile'] == true);
                            final hasNewFile = control.finalList.any((entry) =>
                                entry['id'] == illness.id &&
                                entry.containsKey('hasNewFile') &&
                                entry['hasNewFile'] == true);
                            return HoverScaleCard(
                              child: GestureDetector(
                                onTap: () => control.toggleSelection(illness),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: isSelected
                                        ? Get.theme.primaryColor
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            prefs!.getString(languageKey) ==
                                                    "ar"
                                                ? "${illness.name}"
                                                : "${illness.enName}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                              fontSize:
                                                  contentWidth >= 700 ? 18 : 14,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Get.theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        spacing: 5.0,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _buildIconButton(
                                            width: constraints.maxWidth,
                                            icon: Icons.delete_outline_outlined,
                                            isActive: hasNewFile || hasOldFile,
                                            onPressed: (hasNewFile ||
                                                    hasOldFile)
                                                ? () =>
                                                    control.clearFile(illness)
                                                : null,
                                            isSelected: isSelected,
                                          ),
                                          _buildIconButton(
                                            width: constraints.maxWidth,
                                            icon: Icons.file_upload_outlined,
                                            isActive: true,
                                            onPressed: () =>
                                                control.attachFile(illness),
                                            isSelected: isSelected,
                                          ),
                                          _buildIconButton(
                                            width: constraints.maxWidth,
                                            icon: Icons.file_download_outlined,
                                            isActive: hasOldFile,
                                            onPressed: hasOldFile
                                                ? () => openFileInNewTab(
                                                    filePath:
                                                        '$getpdf${control.finalList[index]['fileid']}')
                                                : null,
                                            isSelected: isSelected,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          apptitle: "Student Illness".tr,
          subtitle: "none",
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required bool isActive,
    required double width,
    required VoidCallback? onPressed,
    required bool isSelected,
  }) {
    return Container(
      width: width > 600 ? 35 : 25,
      height: width > 600 ? 35 : 25,
      decoration: BoxDecoration(
        color: isActive
            ? (isSelected ? Colors.white : Get.theme.primaryColor)
            : Get.theme.disabledColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 1,
          )
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: width > 600 ? 20 : 10,
          color: isActive
              ? (isSelected ? Get.theme.primaryColor : Colors.white)
              : Colors.white,
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 1000) return 2;
    return 1; // لعرض عمود واحد في الشاشات الصغيرة
  }
}
