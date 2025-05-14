import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/UpdateStudentsVaccines.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudentVaccinesDialog extends StatefulWidget {
  final String id;
  final int? indexOfStudent;

  const StudentVaccinesDialog({
    Key? key,
    required this.id,
    this.indexOfStudent,
  }) : super(key: key);

  @override
  _StudentVaccinesDialogState createState() => _StudentVaccinesDialogState();
}

class _StudentVaccinesDialogState extends State<StudentVaccinesDialog> {
  final TextEditingController _searchController = TextEditingController();
  late Vaccines_Controller _vaccinesController;

  @override
  void initState() {
    super.initState();
    _vaccinesController = Get.find<Vaccines_Controller>();
    _vaccinesController.SetFinalList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth * 0.5;

        return VMSAlertDialog(
          action: [
            if (Get.find<Add_Data_controller>().roll != "observer")
              ButtonDialog(
                text: "Done".tr,
                onPressed: _updateStudentVaccines,
                color: Get.theme.primaryColor,
                width: 65,
              )
          ],
          contents: Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: SizedBox(
              width: dialogWidth,
              child: GetBuilder<Vaccines_Controller>(
                builder: (controller) {
                  final filteredList = _getFilteredList(controller);

                  return Column(
                    children: [
                      _buildSearchRow(controller, dialogWidth),
                      if (Get.find<Add_Data_controller>().roll != "observer")
                        _buildFilterCheckbox(controller),
                      Expanded(
                        child: _buildVaccinesGrid(controller, filteredList),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          apptitle: "Student Vaccine".tr,
          subtitle: "none",
        );
      },
    );
  }

  List<Vaccine> _getFilteredList(Vaccines_Controller controller) {
    return controller.isSelectedOnly
        ? controller.filteredvaccine!
            .where((vaccine) => controller.isSelected(vaccine))
            .toList()
        : controller.filteredvaccine!;
  }

  Widget _buildSearchRow(Vaccines_Controller controller, double width) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormSearch(
            click: () => controller.clearFilter(),
            onchange: (value) => controller.searchByName(value),
            width: width - 8, // مع هامش 20
            radius: 5,
            controller: _searchController,
            suffixIcon:
                _searchController.text.isNotEmpty ? Icons.close : Icons.search,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterCheckbox(Vaccines_Controller controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: controller.isSelectedOnly,
            onChanged: (value) => controller.SetisSelectedOnly(value!),
          ),
          Text('Show only selected items'.tr),
        ],
      ),
    );
  }

  Widget _buildVaccinesGrid(
    Vaccines_Controller controller,
    List<Vaccine> filteredList,
  ) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(MediaQuery.of(context).size.width),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.9,
      ),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final vaccine = filteredList[index];
        final isSelected = controller.isSelected(vaccine);
        final hasFile = _hasFile(controller, vaccine);
        final fileName = controller.getFileName(vaccine);

        return _buildVaccineCard(
            controller, vaccine, isSelected, hasFile, fileName!, index);
      },
    );
  }

  Widget _buildVaccineCard(
    Vaccines_Controller controller,
    Vaccine vaccine,
    bool isSelected,
    bool hasFile,
    String fileName,
    int index,
  ) {
    return HoverScaleCard(
      child: GestureDetector(
        onTap: () {
          if (Get.find<Add_Data_controller>().roll != "observer") {
            controller.toggleSelection(vaccine);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 0.5),
            color: isSelected ? Get.theme.primaryColor : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVaccineName(vaccine, isSelected,
                  (MediaQuery.of(context).size.width * 0.5) - 50),
              _buildFileActionsRow(controller, vaccine, isSelected, hasFile,
                  fileName, index, MediaQuery.of(context).size.width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVaccineName(
      Vaccine vaccine, bool isSelected, double contentWidth) {
    return Expanded(
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          prefs!.getString('languageKey') == 'ar'
              ? vaccine.name ?? ""
              : vaccine.enName ?? "",
          style: Get.theme.textTheme.bodyMedium!.copyWith(
            fontSize: contentWidth >= 700 ? 18 : 14,
            color: isSelected ? Colors.white : Get.theme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildFileActionsRow(
    Vaccines_Controller controller,
    Vaccine vaccine,
    bool isSelected,
    bool hasFile,
    String fileName,
    int index,
    double maxWidth,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 5.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Get.find<Add_Data_controller>().roll != "observer")
              _buildFileActionButton(
                width: maxWidth,
                icon: Icons.delete_outline_outlined,
                isActive: hasFile,
                onPressed: hasFile ? () => controller.clearFile(vaccine) : null,
                isSelected: isSelected,
              ),
            if (Get.find<Add_Data_controller>().roll != "observer")
              _buildFileActionButton(
                width: maxWidth,
                icon: Icons.file_upload_outlined,
                isActive: true,
                onPressed: () => controller.attachFile(vaccine),
                isSelected: isSelected,
              ),
            _buildFileActionButton(
              width: maxWidth,
              icon: Icons.file_download_outlined,
              isActive: _hasOldFile(controller, vaccine),
              onPressed: _hasOldFile(controller, vaccine)
                  ? () => _openFile(controller, index)
                  : null,
              isSelected: isSelected,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFileActionButton({
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
          ),
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

  bool _hasFile(Vaccines_Controller controller, Vaccine vaccine) {
    return controller.finalList.any((entry) =>
        entry['id'] == vaccine.id &&
        (entry['hasNewFile'] == true || entry['hasOldFile'] == true));
  }

  bool _hasOldFile(Vaccines_Controller controller, Vaccine vaccine) {
    return controller.finalList.any(
        (entry) => entry['id'] == vaccine.id && entry['hasOldFile'] == true);
  }

  void _openFile(Vaccines_Controller controller, int index) {
    openFileInNewTab(
      filePath: '$getpdf${controller.finalList[index]['fileid']}',
    );
  }

  void _updateStudentVaccines() {
    _vaccinesController.SetFinalList();
    Update_Students_Vaccines_API(Get.context!).Update_Students_Vaccines(
      id: widget.id,
      illness: _vaccinesController.finalList,
    );
  }

  int _getCrossAxisCount(double width) {
    print(width);
    if (width > 1000) return 2;
    return 1; // لعرض عمود واحد في الشاشات الصغيرة
  }
}
