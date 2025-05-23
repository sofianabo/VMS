import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Labrary_Model.dart';

class Labrary_Controller extends GetxController {
  String? filterName = '';

  List<Books>? books;
  List<Books>? filteredEbook;

  bool isLoading = true;

  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;
  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.bytes != null) {
      selectedFile.value = result.files.single.bytes;
      fileName.value = result.files.single.name;
      updateFieldError("file", false);
      updateTextFile("Done Selected File".tr);
    }
  }

  void updateHoverFile(bool value) {
    isHoveringFile = value;
    update();
  }

  void updateTextFile(String value) {
    fileStatus = value;
    isHoveringFile = false;
    update();
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Books> tempFilteredList = List.from(books!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredEbook = tempFilteredList;
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

  void SetData(Labrary_Model labraryModel) {
    books = labraryModel.books;
    filteredEbook = List.from(books!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    SetIsLoading(false);
    update();
  }

  bool IsarnameError = false;
  bool IsennameError = false;
  bool IsfileError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsarnameError = newValue;
        break;
      case 'enname':
        IsennameError = newValue;
        break;
      case 'file':
        IsfileError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  void Clearfile() {
    updateFieldError("file", true);
    fileStatus = "Click To Add File\nOr\nDrag And Drop File Here".tr;
    isHoveringFile = false;
    selectedFile.value = null;
    update();
  }
}
