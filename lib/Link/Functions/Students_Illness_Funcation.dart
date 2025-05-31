import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class StudentsIllnessDialog extends StatefulWidget {
  const StudentsIllnessDialog({Key? key}) : super(key: key);

  @override
  _StudentsIllnessDialogState createState() => _StudentsIllnessDialogState();
}

class _StudentsIllnessDialogState extends State<StudentsIllnessDialog> {
  final TextEditingController _searchController = TextEditingController();

  int _getCrossAxisCount(double width) {
    if (width > 1000) return 2;
    return 1; // لعرض عمود واحد في الشاشات الصغيرة
  }

  Widget _buildIconButton({
    required BuildContext context,
    required double width,
    required IconData icon,
    required bool isActive,
    required VoidCallback? onPressed,
    required bool isSelected,
  }) {
    final buttonSize = width > 600 ? 35.0 : 25.0;
    final iconSize = width > 600 ? 20.0 : 10.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: isActive
              ? (isSelected ? Colors.white : Theme.of(context).primaryColor)
              : Get.theme.disabledColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 1,
            ),
          ],
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize,
            color: isActive
                ? (isSelected ? Theme.of(context).primaryColor : Colors.white)
                : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth * 0.5; // 80% من عرض الشاشة
        final searchWidth = dialogWidth - 8;

        return VMSAlertDialog(
          action: [
            ButtonDialog(
              text: "Done".tr,
              onPressed: () => Get.back(),
              color: Theme.of(context).primaryColor,
              width: 65,
            )
          ],
          contents: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: dialogWidth,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GetBuilder<Illness_Controller>(
                  builder: (control) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormSearch(
                                click: () => control.clearFilter(),
                                onchange: (value) =>
                                    control.searchByName(value),
                                width: searchWidth,
                                radius: 5,
                                controller: _searchController,
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? Icons.close
                                    : Icons.search,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  _getCrossAxisCount(constraints.maxWidth),
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.9,
                            ),
                            itemCount: control.filteredIllness!.length,
                            itemBuilder: (context, index) {
                              final illness = control.filteredIllness![index];
                              final isSelected = control.isSelected(illness);
                              final hasFile = control.hasFile(illness);

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
                                          ? Theme.of(context).primaryColor
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
                                              prefs!.getString('languageKey') ==
                                                      'ar'
                                                  ? illness.name ?? ""
                                                  : illness.enName ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: dialogWidth >= 700
                                                        ? 18
                                                        : 14,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Theme.of(context)
                                                            .primaryColor,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                _buildIconButton(
                                                  context: context,
                                                  width: constraints.maxWidth,
                                                  icon: Icons
                                                      .delete_outline_outlined,
                                                  isActive: hasFile,
                                                  onPressed: hasFile
                                                      ? () => control
                                                          .removeFile(illness)
                                                      : null,
                                                  isSelected: isSelected,
                                                ),
                                                _buildIconButton(
                                                  context: context,
                                                  width: constraints.maxWidth,
                                                  icon: Icons
                                                      .file_upload_outlined,
                                                  isActive: true,
                                                  onPressed: () => control
                                                      .attachFile(illness),
                                                  isSelected: isSelected,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          apptitle: "Student illness".tr,
          subtitle: "none",
        );
      },
    );
  }
}
