import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Add_Quiz_Type_Operation_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Get_Quiz_Type_For_Opiration.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Quiz_Type_For_Operation_Model.dart';
import 'package:vms_school/widgets/Admin/Admin_Table/QuizType_DropDown.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Add_Oparation_Dialog({
  required int? Class_Id,
  required TeachernoteAndGradeReco? controller,
}) {
  Get_Quiz_Type_For_Opiration_API()
      .Get_Quiz_Type_For_Opiration(ClassId: Class_Id.toString());
  return VMSAlertDialog(
      action: [
        Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ButtonDialog(
                text: "Save".tr,
                onPressed: () {
                  Add_Quiz_Type_Operation_API().Add_Quiz_Type_Operation(
                      quizTypeId: controller!.selectedType!.id!,
                      operationType: controller.OperationIndex,
                      ids: controller.selectedTypeIds);
                },
                color: Get.theme.primaryColor,
                width: 100),
            ButtonDialog(
                text: "Back".tr,
                onPressed: () {
                  controller!.goToPage(0);
                },
                color: Get.theme.primaryColor,
                width: 100),
          ]),
        )
      ],
      contents: SizedBox(
        width: 600,
        height: 450,
        child: GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
          if (controller.isQuizTypeOpirationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildMainContent(controller);
        }),
      ),
      apptitle: controller!.currentPage.value == 0
          ? "Select Type".tr
          : "Type Operations".tr,
      subtitle: "none");
}

Widget _buildMainContent(TeachernoteAndGradeReco controller) {
  if (controller.qtfModel?.type == null || controller.qtfModel!.type!.isEmpty) {
    return Center(child: Text("No types available".tr));
  }

  return PageView(
    physics: const NeverScrollableScrollPhysics(),
    controller: controller.pageController,
    onPageChanged: (index) => controller.currentPage.value = index,
    children: [
      _buildTypesSelectionPage(controller),
      _buildTypeOperationsPage(controller),
    ],
  );
}

Widget _buildTypesSelectionPage(TeachernoteAndGradeReco controller) {
  return GridView.builder(
    padding: const EdgeInsets.all(10),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 1.9,
    ),
    itemCount: controller.qtfModel!.type!.length,
    itemBuilder: (context, index) {
      final type = controller.qtfModel!.type![index];
      return _buildTypeCard(controller, type);
    },
  );
}

Widget _buildTypeCard(TeachernoteAndGradeReco controller, Type type) {
  return GestureDetector(
    onTap: () {
      controller.selectType(type);
      controller.goToPage(1);
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Get.theme.primaryColor,
      child: Center(
        child: Text(
          type.name ?? 'Unnamed',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}

Widget _buildTypeOperationsPage(TeachernoteAndGradeReco controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        QuizType_DropDown(
          IsEnabled: true,
          title: "Operation".tr,
          width: 550,
          type: "operation",
        ),
        const SizedBox(height: 20),
        _TypeSelectionContainer(
          allTypes: controller.qtfModel!.type!,
          selectedTypeIds: controller.selectedTypeIds,
          onSelectionChanged: (selectedIds) {
            controller.selectedTypeIds = selectedIds;
          },
          currentSelectedType: controller.selectedType, // أضف هذا
        ),
      ],
    ),
  );
}

class _TypeSelectionContainer extends StatefulWidget {
  final List<Type> allTypes;
  final List<int> selectedTypeIds;
  final Type? currentSelectedType; // أضف هذا المتغير
  final Function(List<int> selectedIds) onSelectionChanged;

  const _TypeSelectionContainer({
    required this.allTypes,
    required this.selectedTypeIds,
    required this.onSelectionChanged,
    required this.currentSelectedType, // أضفه هنا
  });

  @override
  _TypeSelectionContainerState createState() => _TypeSelectionContainerState();
}

class _TypeSelectionContainerState extends State<_TypeSelectionContainer> {
  late List<int> selectedIds;
  late List<Type> availableTypes; // قائمة الأنواع المتاحة بعد الاستبعاد

  @override
  void initState() {
    super.initState();
    availableTypes = widget.allTypes.where((type) {
      return type.id !=
          widget.currentSelectedType?.id; // استبعاد النوع المحدد حالياً
    }).toList();

    selectedIds = List.from(widget.selectedTypeIds);
  }

  void _handleSelection(int typeId, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (!selectedIds.contains(typeId)) {
          selectedIds.add(typeId);
        }
      } else {
        selectedIds.remove(typeId);
      }
    });
    widget.onSelectionChanged(selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Types:'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ...availableTypes.map((type) {
            return CheckboxListTile(
              title: Text(type.name ?? 'Unknown'),
              value: selectedIds.contains(type.id),
              onChanged: (bool? value) {
                if (value != null) {
                  _handleSelection(type.id!, value);
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }).toList(),
          const SizedBox(height: 10),
          Text(
            'Selected:'.tr+' ${selectedIds.length}/${availableTypes.length}',
            style: TextStyle(fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }
}
