import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';

class Vaccines_Controller extends gets.GetxController {
  String? filterName = '';

  List<Vaccine>? vaccine;
  List<Vaccine>? filteredvaccine;

  bool isLoading = true;
  bool isLoadingLocation = true;

  List<String> Locationlist = [];
  String LocationIndex = "";

  SetIsLoadingLocation(bool value) {
    isLoadingLocation = value;
    update();
  }

  SetLocationlist(List<String> data) {
    Locationlist = data;
    SetIsLoadingLocation(false);
    update();
  }

  var chronic = false.obs;
  void togglechronic(bool value) {
    chronic.value = value;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Vaccine> tempFilteredList = List.from(vaccine!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredvaccine = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchByName("");
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void SetData(Vaccines_Model vac) {
    vaccine = vac.vaccine;
    filteredvaccine = List.from(vaccine!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    SetIsLoading(false);
    update();
  }

  List<Vaccine> selectedVaccine = [];
  List<Map<String, dynamic>> files = [];

  void toggleSelection(Vaccine vaccines) {
    print(files);
    if (selectedVaccine.contains(vaccines)) {
      if (hasFile(vaccines)) {
        gets.Get.dialog(Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              surfaceTintColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              content: Container(
                width: 400,
                height: 300,
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 200,
                        child: Image.asset(
                            fit: BoxFit.cover, "../../images/think.gif"),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: gets.Get.theme.primaryColor),
                                  textAlign: TextAlign.center,
                                  "If You Deselected The vaccines The File Will Remove"))),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          shadowColor:
                              const MaterialStatePropertyAll(Color(0xffffffff)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFF2E98A8)),
                          minimumSize:
                              MaterialStatePropertyAll(Size(300 / 3, 50))),
                      child: const Text('Yes',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        removeFile(vaccines); // إزالة الملف إذا كان موجودًا
                        selectedVaccine
                            .remove(vaccines); // إزالة من قائمة التحديد
                        gets.Get.back();
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shadowColor:
                              const MaterialStatePropertyAll(Color(0xffffffff)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFF2E98A8)),
                          minimumSize:
                              MaterialStatePropertyAll(Size(300 / 3, 50))),
                      child: const Text('Back',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        gets.Get.back();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      } else {
        selectedVaccine.remove(vaccines);
        files.removeWhere((file) => file["id"] == vaccines.id.toString());
      }
    } else {
      selectedVaccine.add(vaccines);

      if (!files.any((entry) => entry["id"] == vaccines.id.toString())) {
        files.add({"id": vaccines.id.toString()});
      }
    }
    update();
  }

  bool isSelected(Vaccine vaccines) {
    return selectedVaccine.contains(vaccines);
  }

  void attachFile(Vaccine vaccines) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        Map<String, dynamic>? existingEntry = files.firstWhere(
          (entry) => entry["id"] == vaccines.id.toString(),
          orElse: () => {"id": vaccines.id.toString()},
        );

        existingEntry["file"] = MultipartFile.fromBytes(
          file.bytes!,
          filename: file.name,
        );

        if (!files.contains(existingEntry)) {
          files.add(existingEntry);
        }
      } else {
        if (!files.any((entry) => entry["id"] == vaccines.id.toString())) {
          files.add({"id": vaccines.id.toString()});
        }
      }

      if (!isSelected(vaccines)) {
        toggleSelection(vaccines);
      }
      update();
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void removeFile(Vaccine vaccines) {
    files.removeWhere((file) => file["id"] == vaccines.id.toString());
    update();
  }

  bool hasFile(Vaccine vaccines) {
    return files.any((entry) =>
        entry["id"] == vaccines.id.toString() && entry.containsKey("file"));
  }

  String? getFileName(Vaccine vaccines) {
    Map<String, dynamic>? entry = files.firstWhere(
      (entry) => entry["id"] == vaccines.id.toString(),
      orElse: () => {},
    );
    String? filename = entry["file"]?.filename?.toString();

    if (filename != null) {
      if (filename.length > 12) {
        return "${filename.substring(0, 8)}..${filename.substring(filename.length - 4)}";
      }
      return filename;
    }

    return "Vaccine File";
  }
}
