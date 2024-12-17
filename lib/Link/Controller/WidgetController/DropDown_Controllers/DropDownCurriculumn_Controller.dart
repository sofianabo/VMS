import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Curriculumn_Controller extends GetxController {

  List<Curriculum>? curriculum;
  bool isFailingSubject = false;
  bool isLoading = true;
  bool isHoveringFile = false;
  String fileStatus = "Click To Add File\nOr\nDrag And Drop File Here";
  bool isHoveringimage = false;
  String imageStatus = "Click To Add Image\nOr\nDrag And Drop Image Here";


  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);

  Rx<Uint8List?> selectedFile = Rx<Uint8List?>(null);
  RxString fileName = "".obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      selectedImage.value = fileBytes;
      updateTextImage("Done Selected Image");
    } else {

    }
  }



  Dragedimage(DropzoneFileInterface pickedFile) async {
    // Uint8List fileBytes = await pickedFile.readAsBytes();
    // selectedImage.value = fileBytes;
    // updateTextImage("Image Successfully Dropped!");
  }


  DragedFile(DropzoneFileInterface pickedFile) async {
    // final fileBytes = await pickedFile.getFileBytes ();
    // selectedFile.value = fileBytes;
    // updateTextFile("PDF File Successfully Dropped!");
  }




  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.bytes != null) {
      selectedFile.value = result.files.single.bytes;
      fileName.value = result.files.single.name;

      updateTextFile("Done Selected File");
    }
  }



  void updateHoverFile(bool value) {
    isHoveringFile = value;
    update();
  }
  void updateHoverImage(bool value) {
    isHoveringimage = value;
    update();
  }
  void updateTextImage(String value) {
    imageStatus = value;
    update();
  }
  void updateTextFile(String value) {
    fileStatus = value;
    update();
  }

  void updateSelection(bool value) {
    isFailingSubject = value;
    update();
  }

  String SessionIndex = "";
  String ClassIndex = "";
  String semesterIndex = "";

  List<String> arlistSession = [
    "First Semester",
    "Second Semester",
  ];
  List<String> enlistSession = [
    "الفصل الأول",
    "الفصل الثاني",
  ];

  List<String> listClass = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  List<String> listSemester = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  // addData(String Name, String max, String passing) {
  //   Curriculum.addAll([
  //     {
  //       "name": "$Name",
  //       "img": "First Division",
  //       "max": "$max",
  //       "passing": "$passing",
  //       "class": "$selectClassIndex",
  //       "semester": "$selectsemesterIndex",
  //       "isFulling": "$isFailingSubject",
  //     }
  //   ]);
  //   ClassIndex = "";
  //   semesterIndex = "";
  //   SessionIndex = "";
  //   isFailingSubject = false;
  //   update();
  // }

  // deleteCurriculum(int index) {
  //   Curriculum.removeAt(index);
  //   update();
  // }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        SessionIndex = index ?? "";
        break;
      case 'class':
        ClassIndex = index ?? "";
        break;
      case 'semester':
        semesterIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        enlistSession = options;
        break;
      case 'class':
        listClass = options;
        break;
      case 'semester':
        listSemester = options;
        break;
    }
    update();
  }

  String get selectSessionIndex => SessionIndex;

  String get selectClassIndex => ClassIndex;

  String get selectsemesterIndex => semesterIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void SetCurriculum(Curriculum_Model curriculum_model) {
    curriculum = curriculum_model.curriculum;
    SetIsLoading(false);
    update();
  }
}
