import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class Qustions_Bank_Controller extends GetxController {
  List<Curriculum>? curriculum;

  List<Map<String, dynamic>> qustions_Bank = [
    {
      "icon": VMS_Icons.paper,
      "text": "True Or False".tr,
      "subTitle": "Simple questions requiring a true or false selection.".tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.tf,
      "text": "Choose the correct".tr,
      "subTitle": "Choose the correct answer from several options".tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.checkone,
      "text": "Fill in the blanks".tr,
      "subTitle":
          "Complete the sentences with appropriate words and phrases.".tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.dragdrop,
      "text": "Drag and drop texts and images".tr,
      "subTitle":
          "Match images and texts by dragging and dropping them onto their appropriate places."
              .tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.same,
      "text": "Essay questions".tr,
      "subTitle":
          "Questions consisting of large blanks suitable for topics and articles."
              .tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.fill,
      "text": "Multiple-choice question with multiple answers".tr,
      "subTitle":
          "A multiple-choice question with a list of options that allows you to select multiple choices instead of one."
              .tr,
      "onTap": () {}
    },
    {
      "icon": VMS_Icons.multiselect,
      "text": "Matching questions".tr,
      "subTitle":
          "A question similar to traditional matching, in that it is a text that must be matched with a text from the added elements."
              .tr,
      "onTap": () {}
    },
  ];

  bool isLoading = true;
  SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  setCurriculum(Curriculum_Model curruculums) {
    curriculum = curruculums.curriculum;
    id = "${curruculums.curriculum![0].id ?? 0}";
    SetIsLoading(false);
    update();
  }

  String? id;
  int idx = 0;
  setSelectedCurriculum(int index) {
    id = curriculum![index].id.toString();
    idx = index;
    update();
  }
}
