import 'package:get/get.dart';
import 'package:vms_school/Icons_File/LMS_Icons/l_m_s__icons_icons.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/TrueOrFalse/TrueOrFalseQuestionManagment.dart';

class Qustions_Bank_Controller extends GetxController {
  List<Curriculum>? curriculum;

  List<Map<String, dynamic>> qustions_Bank = [
    {
      "icon": LMS_Icons.tf,
      "text": "True Or False".tr,
      "subTitle": "Simple questions requiring a true or false selection.".tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>().addToPath("True or False".tr);
      }
    },
    {
      "icon": LMS_Icons.checkone,
      "text": "Choose the correct".tr,
      "subTitle": "Choose the correct answer from several options".tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>()
            .addToPath("Choose the correct answer".tr);
      }
    },
    {
      "icon": LMS_Icons.fill,
      "text": "Fill in the blanks".tr,
      "subTitle":
          "Complete the sentences with appropriate words and phrases.".tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>()
            .addToPath("Fill in the blanks".tr);
      }
    },
    {
      "icon": LMS_Icons.dragdrop,
      "text": "Drag and drop texts and images".tr,
      "subTitle":
          "Match images and texts by dragging and dropping them onto their appropriate places."
              .tr,
      "onTap": () {}
    },
    {
      "icon": LMS_Icons.paper,
      "text": "Essay questions".tr,
      "subTitle":
          "Questions consisting of large blanks suitable for topics and articles."
              .tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>().addToPath("article".tr);
      }
    },
    {
      "icon": LMS_Icons.multiselect,
      "text": "Multiple-choice question with multiple answers".tr,
      "subTitle":
          "A multiple-choice question with a list of options that allows you to select multiple choices instead of one."
              .tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>().addToPath("MultiChoise".tr);
      }
    },
    {
      "icon": LMS_Icons.same,
      "text": "Matching questions".tr,
      "subTitle":
          "A question similar to traditional matching, in that it is a text that must be matched with a text from the added elements."
              .tr,
      "onTap": () {
        Get.find<Selected_Class_Controller>().addToPath("Matching".tr);
      }
    },
    {
      "icon": LMS_Icons.multiselect,
      "text": "Multi Choise with Picture".tr,
      "subTitle":
          "A list of options that allows you to respond to an image with one option or multiple options."
              .tr,
      "onTap": () {
         Get.find<Selected_Class_Controller>()
            .addToPath("Multi Choice Picture".tr);
      }
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

  String? id = "1";
  int idx = 0;
  setSelectedCurriculum(int index) {
    id = curriculum![index].id.toString();
    idx = index;
    update();
  }
}
