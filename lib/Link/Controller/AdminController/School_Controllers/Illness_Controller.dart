import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/Model/AdminModel/School_Models/Illness_Model.dart';

class Illness_Controller extends gets.GetxController {
  List<Illness> selectedIllnesses = [];
  List<Map<String, dynamic>> files = [];

  void toggleSelection(Illness illness) {
    print(files);
    if (selectedIllnesses.contains(illness)) {
      if (hasFile(illness)) {
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
                                  "If You Deselected The Illness The File Will Remove"))),
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
                        removeFile(illness); // إزالة الملف إذا كان موجودًا
                        selectedIllnesses
                            .remove(illness); // إزالة من قائمة التحديد
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
        selectedIllnesses.remove(illness);
        files.removeWhere((file) => file["id"] == illness.id.toString());
      }
    } else {
      selectedIllnesses.add(illness);

      if (!files.any((entry) => entry["id"] == illness.id.toString())) {
        files.add({"id": illness.id.toString()});
      }
    }
    update();
  }

  bool isSelected(Illness illness) {
    return selectedIllnesses.contains(illness);
  }

  String? filterName = '';

  List<Illness>? illness;
  List<Illness>? filteredIllness;

  bool isLoading = true;

  var chronic = false.obs;

  void togglechronic(bool value) {
    chronic.value = value;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Illness> tempFilteredList = List.from(illness!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredIllness = tempFilteredList;
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

  void SetData(Illness_Model illness_Model) {
    final previousSelectedIllnesses = List<Illness>.from(selectedIllnesses);

    illness = illness_Model.illness;
    filteredIllness = List.from(illness!);

    selectedIllnesses = illness!
        .where((illness) => previousSelectedIllnesses.any(
              (selected) => selected.id == illness.id,
            ))
        .toList();

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void attachFile(Illness illness) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        Map<String, dynamic>? existingEntry = files.firstWhere(
          (entry) => entry["id"] == illness.id.toString(),
          orElse: () => {"id": illness.id.toString()},
        );

        existingEntry["file"] = MultipartFile.fromBytes(
          file.bytes!,
          filename: file.name,
        );

        if (!files.contains(existingEntry)) {
          files.add(existingEntry);
        }
      } else {
        if (!files.any((entry) => entry["id"] == illness.id.toString())) {
          files.add({"id": illness.id.toString()});
        }
      }

      if (!isSelected(illness)) {
        toggleSelection(illness);
      }
      update();
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void removeFile(Illness illness) {
    files.removeWhere((file) => file["id"] == illness.id.toString());
    update();
  }

  bool hasFile(Illness illness) {
    return files.any((entry) =>
        entry["id"] == illness.id.toString() && entry.containsKey("file"));
  }

  String? getFileName(Illness illness) {
    Map<String, dynamic>? entry = files.firstWhere(
      (entry) => entry["id"] == illness.id.toString(),
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
