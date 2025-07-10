import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import '../../../../../../../Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import '../../../../../../../Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';

class Add_Jalaa_Third_Page extends StatelessWidget {
  const Add_Jalaa_Third_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Page_Controller>(
      init: Jalaa_Page_Controller(),
      builder: (controller) {
        if (controller.curriculum == null || controller.isCurrLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              Expanded(
                child: SubjectBox(
                  title: "المواد الأساسية",
                  subjects: controller.primarySubjects,
                  onReorder: controller.reorderPrimarySubjects,
                  isPrimary: true,
                  controller: controller,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SubjectBox(
                  title: "المواد الثانوية",
                  subjects: controller.secondarySubjects,
                  onReorder: controller.reorderSecondarySubjects,
                  isPrimary: false,
                  controller: controller,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SubjectBox extends StatelessWidget {
  final String title;
  final List<Curriculum> subjects;
  final void Function(int oldIndex, int newIndex) onReorder;
  final bool isPrimary;
  final Jalaa_Page_Controller controller;

  const SubjectBox({
    required this.title,
    required this.subjects,
    required this.onReorder,
    required this.isPrimary,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<Curriculum>(
      onWillAccept: (data) =>
          data != null && !subjects.any((e) => e.id == data.id),
      builder: (context, candidateData, rejectedData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: isPrimary
                      ? controller.primarySubjects.isNotEmpty
                          ? Icon(Icons.edit)
                          : SizedBox.shrink()
                      : controller.secondarySubjects.isNotEmpty
                          ? Icon(Icons.edit)
                          : SizedBox.shrink(),
                  onPressed: () async {
                    final List<Curriculum>? selected =
                        await Get.dialog(SubjectSelectionDialog(
                      allSubjects: controller.curriculum,
                      alreadySelected: isPrimary
                          ? controller.primarySubjects
                          : controller.secondarySubjects,
                      otherGroup: isPrimary
                          ? controller.secondarySubjects
                          : controller.primarySubjects,
                    ));

                    if (selected != null) {
                      if (isPrimary) {
                        controller.addToPrimary(selected);
                      } else {
                        controller.addToSecondary(selected);
                      }
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  if (isPrimary && controller.primarySubjects.isEmpty) {
                    final List<Curriculum>? selected =
                        await Get.dialog(SubjectSelectionDialog(
                      allSubjects: controller.curriculum,
                      alreadySelected: isPrimary
                          ? controller.primarySubjects
                          : controller.secondarySubjects,
                      otherGroup: isPrimary
                          ? controller.secondarySubjects
                          : controller.primarySubjects,
                    ));

                    if (selected != null) {
                      if (isPrimary) {
                        controller.addToPrimary(selected);
                      } else {
                        controller.addToSecondary(selected);
                      }
                    }
                  } else if (!isPrimary &&
                      controller.secondarySubjects.isEmpty) {
                    final List<Curriculum>? selected =
                        await Get.dialog(SubjectSelectionDialog(
                      allSubjects: controller.curriculum,
                      alreadySelected: isPrimary
                          ? controller.primarySubjects
                          : controller.secondarySubjects,
                      otherGroup: isPrimary
                          ? controller.secondarySubjects
                          : controller.primarySubjects,
                    ));

                    if (selected != null) {
                      if (isPrimary) {
                        controller.addToPrimary(selected);
                      } else {
                        controller.addToSecondary(selected);
                      }
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.theme.canvasColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: subjects.isEmpty
                      ? Center(
                          child: Text(
                          "اضغط لأضافة المواد هنا",
                          style: TextStyle(color: Colors.white),
                        ))
                      : ReorderableListView.builder(
                          buildDefaultDragHandles: false,
                          proxyDecorator: (child, index, animation) {
                            return Material(
                              surfaceTintColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              color: Get
                                  .theme.canvasColor, // لون الخلفية أثناء السحب
                              elevation: 6,
                              shadowColor: Colors.black,
                              child: child,
                            );
                          },
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            final item = subjects[index];
                            return ListTile(
                              key: ValueKey(item.id),
                              title: Text(
                                item.name ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: ReorderableDragStartListener(
                                index: index,
                                child: const Icon(
                                  Icons.drag_handle,
                                  color:
                                      Colors.white, // لون زر التحريك الذي تريده
                                ),
                              ),
                            );
                          },
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) newIndex--;
                            onReorder(oldIndex, newIndex);
                          },
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SubjectSelectionDialog extends StatefulWidget {
  final List<Curriculum> allSubjects;
  final List<Curriculum> alreadySelected;
  final List<Curriculum> otherGroup;

  const SubjectSelectionDialog({
    super.key,
    required this.allSubjects,
    required this.alreadySelected,
    required this.otherGroup,
  });

  @override
  State<SubjectSelectionDialog> createState() => _SubjectSelectionDialogState();
}

class _SubjectSelectionDialogState extends State<SubjectSelectionDialog> {
  late List<Curriculum> tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = List.from(widget.alreadySelected);
  }

  @override
  Widget build(BuildContext context) {
    final availableSubjects = widget.allSubjects
        .where((e) => !widget.otherGroup.any((s) => s.id == e.id))
        .toList();

    return VMSProfileAlertDialog(
        action: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, tempSelected),
            child: const Text("تم"),
          ),
        ],
        contents: SizedBox(
          width: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: availableSubjects.length,
            itemBuilder: (context, index) {
              final subject = availableSubjects[index];
              final isSelected =
                  tempSelected.any((element) => element.id == subject.id);

              return CheckboxListTile(
                value: isSelected,
                title: Text(subject.name ?? ''),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      tempSelected.add(subject);
                    } else {
                      tempSelected.removeWhere((e) => e.id == subject.id);
                    }
                  });
                },
              );
            },
          ),
        ),
        apptitle: "اختر المواد",
        subtitle: "none");
  }
}
